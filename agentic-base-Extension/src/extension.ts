import * as vscode from 'vscode';
import { exec } from 'child_process';
import * as path from 'path';

export function activate(context: vscode.ExtensionContext) {
    let disposable = vscode.commands.registerCommand('agentic-base-launcher.bootstrap', () => {
        const config = vscode.workspace.getConfiguration('agenticBaseLauncher');
        const sourcePath = config.get<string>('sourcePath');
        const workspaceFolders = vscode.workspace.workspaceFolders;

        if (!workspaceFolders) {
            vscode.window.showErrorMessage('No workspace opened.');
            return;
        }

        const targetPath = workspaceFolders[0].uri.fsPath;
        // agentic-base本体の中にあるスクリプトのパスを組み立て
        const scriptPath = path.join(sourcePath!, 'scripts', 'bootstrap-project.sh');
        // ステータスバー（右下）にボタンを作成
        let statusBarItem = vscode.window.createStatusBarItem(vscode.StatusBarAlignment.Right, 100);
        statusBarItem.command = 'agentic-base-launcher.bootstrap';
        statusBarItem.text = `$(rocket) Agentic-Base`; 
        // ロケットアイコンと文字
        statusBarItem.tooltip = 'Initialize agentic-base in this project';
        statusBarItem.show();
        context.subscriptions.push(statusBarItem);
        vscode.window.showInformationMessage(`Bootstrapping agentic-base from ${sourcePath}...`);

        // ターミナルを作成してコマンドを実行
        const terminal = vscode.window.createTerminal('Agentic-Base Bootstrap');
        terminal.show();
        terminal.sendText(`bash "${scriptPath}" "${targetPath}"`);
    });

    context.subscriptions.push(disposable);
}

export function deactivate() {}