# LaTeX in VSCode

VSCode で LaTeX 作業をする上で自分が使っている設定

## 特徴

- ~~LaTeX Workshop の自動ビルドが好きではないので、Run on Save によりコマンド感覚でビルドしている。
  この方法なら、`~/.latexmkrc` を作成する必要がない。~~
  やっぱり LaTeX Workshop に沿って作り直し中。

- 毎週の課題形式（`report`）、期末レポート形式（`paper`）、スライド形式（`bermer`）のユーザースニペットが用意されている。
  これにより、面倒な LaTeX の設定を省略して、ファイル作成から 10 秒で本文を書き始められる。

## 使い方

### `\report`

![](https://github.com/yuji96/LaTeX-in-VSCode/blob/master/_movies/report.gif)

### `\paper`

![](https://github.com/yuji96/LaTeX-in-VSCode/blob/master/_movies/paper.gif)

### `\beamer`

![](https://github.com/yuji96/LaTeX-in-VSCode/blob/master/_movies/beamer.gif)

これは LaTeX エンジンによってドキュメントクラスの変更が必要。

### `\comment`

![](https://github.com/yuji96/LaTeX-in-VSCode/blob/master/_movies/comment.gif)

コメント内でも `\begin, \end` は反応するのを利用した。裏技を発見した気分。

## おすすめ拡張方法

### PC 上のどのファイルでもこの設定を使いたい

このリポジトリ内の `.vscode` の設定をグローバルにコピペする必要がある。

`.vscode/settings.json -> ~/Library/Application\ Support/Code/User/settings.json`

`.vscode/latex.code-snippets -> ~/Library/Application\ Support/Code/User/snippets/latex.json`

### `$` を括弧として登録

`LaTeX` の言語設定ファイルである `~/.vscode/extensions/james-yu.latex-workshop-8.17.0/syntax/syntax.json` の `brackets, autoCloseingPairs, surroundingPairs` に他の括弧の記述を真似して `$` を追加すると以下のような挙動になる。

![](https://github.com/yuji96/LaTeX-in-VSCode/blob/master/_movies/math.gif)

### ユーザースニペットの変更

ユーザースニペットの `body` の部分は `tex2json.py` で自動生成できる。
あとでコピペすることを考えてクリップボードに直接出力している。（`pyperclip` ライブラリのインストールが必要。）

```zsh
python tex2json.py original.tex
```

### ショートカット

- 以下のようなショートカットキーを `keybindings.json` に登録したら意外と効率が上がった。
  「スペースを入力したい」と思った時に、`shift+^` ではなく直感通りの `shift+space` で `~` を入力する設定。

```json
{
  "key": "shift+space",
  "command": "type",
  "args": { "text": "~" },
  "when": "editorTextFocus && editorLangId == latex"
}
```

- ビルドを Run on Save にしたことで、PDF Viewer がタイプセット後に自動更新されないため、ショートカットキーを登録すると便利。

```json
{
  "key": "shift+l",
  "command": "latex-workshop.refresh-viewer",
  "when": "!editorTextFocus"
}
```

## 前提・備考

- **必要な環境**
  - VSCode
    - LaTeX Workshop
    - Run on Save
  - TeXLive 2017（動けばこれ以外でも OK）

Run on Save のコマンドは macOS を前提としている。

このディレクトリ内だけでなく PC 全体でこの機能を使うためには、`.vscode` 内の設定をグローバルにコピペする必要がある。

他の人の環境で動くのかは謎。
