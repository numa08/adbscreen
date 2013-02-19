# Getting started

The tool what can take an Android devices's screen shot on command line.

# Installation
1. You must install Android Development Tool, and then can use `monkeyrunner` command.
2. Copy `adbscreen.py` and `adbscreen.sh` to dirctory where path crear (ex. /usr/local/bin).

# How to use?
## Most basic command

```bash
adbscreen
```

Then, you can get screen shot in your current dirctory.

## Options

* -s Select device serial number.If you don't select , then script selects automatic.

* -f Set screen shot file name. If you don't select , then file name is named `SERIAL NUMBER.png`.

## Application

When you want take some devices screen shot, you write next script.

```bash
#!/bin/sh
# This file is in public domain.
for id in `adb devices | grep '^[0-9A-F]' | cut -c 1-16`; do adbscreen -s $id; done
```

------------

# adbscreenとは

Androiデバイスのスクリーンショットをコマンドラインから撮影するツールです

# インストール方法
1. Android Development Tool のインストールと、monkeyrunnerにパスが通っていることを確認します。
2. `adbscreen.py`と`adbscreen.sh`をあなたのパスが通ったディレクトリ(ex.  /usr/local/bin)にコピーします。

# 使い方
## 最も基本的なコマンド

```bash
adbscreen
```

これだけでカレントディレクトリにスクリーンショットが保存されます。

## オプション

* -s スクリーンショットを撮影したい端末のシリアル番号を指定します。未指定の場合は、自動的に選択されます。

* -f 撮影したスクリーンショットのファイル名を指定します。未指定の場合は、`シリアル番号.png`となります

## 応用

複数の端末のスクリーンショットを一度に取りたい場合、例えば次の様なスクリプトとなります。

```bash
#!/bin/sh
# This file is in public domain.
for id in `adb devices | grep '^[0-9A-F]' | cut -c 1-16`; do adbscreen -s $id; done
```