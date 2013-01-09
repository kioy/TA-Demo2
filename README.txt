Rogue: Exploring the Dungeons of Doom
	Copyright (C) 1980-1983, 1985, 1999 Michael Toy, Ken Arnold and 
	Glenn Wichman All rights reserved.

	Revision by Y.Oz (Y.Oz Vox)  [yozvox at yahoo dot co dot jp]



I revised it about the following items.  

1. I ported this software to Windows console (Cygwin).  Of course you 
  can run this software on Linux.

2!. You can use the "color" option in environment variable 
  "ROGUEOPTS".  This displays a map by a color.  I took a color of 
  IBM-PC version Rogue into account.  You should use the "bright" 
  option if you expect the color of NEC PC-9801/8801 version.

3. I changed a Rogue program to be able to set a user name with a 
  command-line option.  From a command-line, please input a user name 
  after "-n" option (or, "-u") as follows, and run.  You can use "?" 
  for name character string to input a name after starting software.

	rogue -n username
	rogue -n ?

4. You can use the "name=?" option in environment variable 
  "ROGUEOPTS".  When you begin a game, Rogue will hear your name.

5#. You can use the "rank" option to use the rank name in an 
  environment variable "ROGUEOPTS".

6#. You can use the "slime" option to let "Slime" and "Ur-vile" appear 
  instead of "Snake" and "black Unicorn" in an environment variable 
  "ROGUEOPTS".  When you fight with "Slime", "Slime" sometimes 
  multiplies.  Therefore you must pay attention for slime.

7#. You can use the "idscrl" option to change identify scroll to only 
  one kind in an environment variable "ROGUEOPTS".  You cannot change 
  it during a game.

8#. You can use the "pcmode" option to change kinds of scrolls, 
  potions, e.t.c. to like sets of IBM-PC or NEC PC-x801 in an 
  environment variable "ROGUEOPTS".  You cannot change it during a 
  game.

9#. You can use "-11", "-14" or "-16" option  with a command-line 
  option.  It is the same as 
  "ROGUEOPTS=passgo,color,bright,rank,slime,idscrl,pcmode,name=?" 
  ("slime" is the case of "-14" and "-16", "bright" is the case of 
  "-16").  You can use "-11 username" or "-16 username", too.

10p. When you make a "lan.cfg" file of contents with "/home/username/" 
  or "C:\", Rogue comes to make a score file there.  The path name must 
  be over in "/" or "\".  When you set shared folders such as the 
  office LAN in a "lan.cfg" file, you can compete with an in-house 
  member for score of Rogue.

11. For a person except the English zone, I bundled batch file to run a 
  command-line with English mode.  Please double-click "cmd_us.bat".

note) "!" are for "p" and "x" version. "#" are for only "x" version.

---*---*---*---

以下の点について修正を行いました。

1. これはRogue 5.4を、Windowsのコンソールプログラム（Cygwin）として移植
  したものです。もちろん、Linux上で動作させることも可能です。

2!. 環境変数「ROGUEOPTS」に「color」オプションが使えます。これはマップを
  カラー表示にするためのものです。配色は、IBM-PC版Rogueを参考にしていま
  す。「bright」にすると、NEC PC-9801/8801版の配色を参考にしたものになり
  ます。

3. ユーザの名前をコマンドラインから指定できるようにプログラムを変更して
  あります。コマンドラインから、「-n」（もしくは「-u」）に続けて名前を指
  定して実行してください。ゲーム開始後に名前の文字列を入力するようにする
  には、名前に「?」を指定してください。

	rogue -n username
	rogue -n ?

4. 環境変数「ROGUEOPTS」に「name=?」を用いることもできます。ゲームを始め
  ると、Rogueは名前を聞いてくるでしょう。

5#. 「ROGUEOPTS」環境変数で、階級名オプション「rank」が使えます。

6#. 「ROGUEOPTS」環境変数で、Slimeオプション「slime」が使えます。
  「Snake」と「black Unicorn」の代わりに、「Slime」と「Ur-vile」が登場し
  ます。「Slime」は戦闘中分裂するので、注意が必要です。

7#. 「ROGUEOPTS」環境変数で、Identify Scrollを1種類だけにするオプション
  「idscrl」が使えます。ゲーム中に切り替える事はできません。

8#. 「ROGUEOPTS」環境変数で、巻物や水薬などをIBM-PC/PC-x801相当にするオ
  プション「pcmode」が使えます。ゲーム中に切り替える事はできません。

9#. コマンドラインから、「-11」、「-14」、「-16」オプションが使えます。
  "ROGUEOPTS=passgo,color,bright,rank,slime,idscrl,pcmode,name=?" 
  （"slime"は「-14」と「-16」、"bright"は「-16」の場合のみ）で起動したの
  と同じ状態になります。「-11 username」や「-16 username」も使えます。

10p. あなたが、「/home/username/」とか「C:\」とかの内容の「lan.cfg」ファ
  イルを作成しておくと、Rogueはそこにスコアファイルを作成するようになり
  ます。パス名は、「/」か「\」で終わっていなければなりません。あなたが、
  社内LAN等の共有フォルダを、「lan.cfg」ファイルに設定しておくと、あなた
  は社内のメンバーとRogueのスコアを競うことができます。

11. 英語圏以外の人のために、英語モードのコマンドラインを立ち上げるバッチ
  ファイルを添付しました。「cmd_us.bat」をダブルクリックしてください。

注）「!」は「p」と「x」バージョン用です。「#」は「x」バージョン専用です。

---*---*---*---
