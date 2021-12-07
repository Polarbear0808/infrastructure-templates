# infrastructure-templates
マシンのセットアップや普段使用しているテンプレートをまとめるワークスペースです。

## windowsマシンのセットアップ
新しいWindowsマシンにソフトを入れます。  
chocolateyを使用します。なお、以下のスクリプトはすべて管理者権限で実行します。

### [chocolatey get started スクリプト](https://chocolatey.org/install)を実行

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

### `./powershell/install-softwares.ps1` を実行

```
Set-ExecutionPolicy Bypass -Scope Process -Force; powershell ./powershell/install-softwares.ps1
```

### WSLインストール
[MSのインストールページ](https://docs.microsoft.com/ja-jp/windows/wsl/install)を参照  
仮想化がオンになっていない可能性あり  
[参考：【WSL2】wsl2のインストールで0x80370102 エラーが出たときの対処方法【HP】](https://monkey999por.hatenablog.com/entry/2020/10/01/221243)


## vscodeのセットアップ
`./.vscode/extensions.json` にある拡張機能をインストールします。
