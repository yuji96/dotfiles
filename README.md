# LaTeX in VSCode

VSCode で LaTeX 作業をする上で自分が使っている設定

## 特徴

- LaTeX Workshop の自動ビルドが好きではないので、Run on Save によりコマンド感覚でビルドしている。
  この方法なら、`~/.latexmkrc` を作成する必要がない。

- 毎週の課題形式（`report`）、期末レポート形式（`paper`）、スライド形式（`bermer`）のユーザースニペットが用意されている。
  これにより、面倒な LaTeX の設定を省略して、ファイル作成から 10 秒で本文を書き始められる。

## 使い方

### `\report`

### `\paper`

### `\beamer`

### `\comment`

## おすすめ拡張方法

### ユーザースニペットの変更

- ユーザースニペットの `body` の部分は `tex2json.py` で自動生成できる。

### ショートカット

- ~の shortcut
- shift L
  ビルドを Run on Save で実行すると、保存時に PDF Viewer が自動更新されないため、ショートカットキーを登録すると便利。

### 言語設定

- $$をカッコとする

## 前提・備考

LaTeX, VSCode がインストール済みで VSCode に LaTeX Workshop と Run on Save がインストールされていること。

Run on Save のコマンドは macOS を前提としている。

このディレクトリ内だけでなく PC 全体でこの機能を使うためには、`.vscode` 内の設定をグローバルにコピペする必要がある。

自分の環境では動くが、他の人の環境で動くのかは謎。
