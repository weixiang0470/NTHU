# strings it & Wave a flag
- strings
    - `wget https://jupiter.challenges.picoctf.org/static/fae9ac5267cd6e44124e559b901df177/strings `
    - `strings strings | grep pico`
- Wave
    - `wget https://mercury.picoctf.net/static/a00f554b16385d9970dae424f66ee1ab/warm`
    1. `strings warm | grep pico`
    2. `chmod +x warm`
    - `./warm -h`

# Commands
- `ps`
    - `ps f`
    - `ps aux`
- `kill`
    - `kill -9 process_id`
- `file executable_file`
    - Start with `ELF` is linux, `PE` is windows
- `wget`
    - `wget download_link -O output_name`
        - download the file and rename into output_name

# Python to exe
- `virtualenv test_env`
- `source test_env/bin/activate`
- `pip install pyinstaller`
- create a python file and code it, let's say the we got `test.py`
- `pyinstaller --onefile test.py`
- `./dist/test`

# exe to python
1. exe to `.pyc`
    - `https://pyinstxtractor-web.netlify.app`
2. `.pyc to .py`
    - `https://pylingual.io/view_chimera?identifier=7976d5d44328320b4b65b9234e2e4f86c162072a3124781ed8e6566b978d6ff0`