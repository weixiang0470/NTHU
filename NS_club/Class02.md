# **WSL**
- It is a linux virtual machine on windwos
- Install wsl on windows
    - `wsl --install`

# Web request
- GET : get something from server
    - parameters limit to 2k in path
    - to bypass some communicate with server to have fast responce
- POST : to communicate with backend server
- PUT : transfer file
- HEAD : request front header

# csrf
- 跨站請求攻擊
- 限制只收特定網站的請求

# insp3ct0r
- Get the flag from `41511.html`,`mycss.css`,`myjs.js` file
- picoCTF{tru3_d3t3ct1ve_0r_ju5t_lucky?832b0699}

# GET aHEAD
1. Solution1
    - `curl -X HEAD http://mercury.picoctf.net:47967/ -v`
    - picoCTF{r3j3ct_th3_du4l1ty_cca66bd3}

2. Solution2
    - Use firefox, F12 -> Network -> Edit & Resend
    - Use HEAD to request and the flag will containing in header

# Cookie
- Will keep in browser, even closed the web
- for record data
- Session ID, is login?

# Session
- Closed the web then clear
- for record data

# Others
- https://haveibeenpwned.com