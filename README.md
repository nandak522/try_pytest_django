```sh
(venv) bbadmin@hello-world-59d96d5df4-z8m8r:/app/src/test_pytest$ pytest
Test session starts (platform: linux, Python 3.6.7, pytest 3.5.1, pytest-sugar 0.9.1)
Django settings: test_pytest.settings (from environment variable)
rootdir: /app/src/test_pytest, inifile: pytest.ini
plugins: sugar-0.9.1, django-3.2.1, cov-2.5.1

\r \x1b[36mpolls/\x1b[0mtests.py\x1b[0m \x1b[32m\u2713\x1b[0m                                                                                            \x1b[32m25% \x1b[0m\x1b[40m\x1b[32m\u2588\x1b[0m\x1b[40m\x1b[32m\u2588\u258c       \x1b[0m\r \x1b[36mpolls/\x1b[0mtests.py\x1b[0m \x1b[32m\u2713\x1b[0m\x1b[32m\u2713\x1b[0m                                                                                           \x1b[32m50% \x1b[0m\x1b[40m\x1b[32m\u2588\x1b[0m\x1b[40m\x1b[32m\u2588\x1b[0m\x1b[40m\x1b[32m\u2588\x1b[0m\x1b[40m\x1b[32m\u2588\u2588     \x1b[0m\r \x1b[36mpolls/\x1b[0mtests.py\x1b[0m \x1b[32m\u2713\x1b[0m\x1b[32m\u2713\x1b[0m\x1b[32m\u2713\x1b[0m                                                                                          \x1b[32m75% \x1b[0m\x1b[40m\x1b[32m\u2588\x1b[0m\x1b[40m\x1b[32m\u2588\x1b[0m\x1b[40m\x1b[32m\u2588\x1b[0m\x1b[40m\x1b[32m\u2588\u2588\x1b[0m\x1b[40m\x1b[32m\u2588\x1b[0m\x1b[40m\x1b[32m\u2588\u258c  \x1b[0m\r \x1b[36mpolls/\x1b[0mtests.py\x1b[0m \x1b[32m\u2713\x1b[0m\x1b[32m\u2713\x1b[0m\x1b[32m\u2713\x1b[0m\x1b[32m\u2713\x1b[0m                                                                                        \x1b[32m100% \x1b[0m\x1b[40m\x1b[32m\u2588\x1b[0m\x1b[40m\x1b[32m\u2588\x1b[0m\x1b[40m\x1b[32m\u2588\x1b[0m\x1b[40m\x1b[32m\u2588\u2588\x1b[0m\x1b[40m\x1b[32m\u2588\x1b[0m\x1b[40m\x1b[32m\u2588\x1b[0m\x1b[40m\x1b[32m\u2588\x1b[0m\x1b[40m\x1b[32m\u2588\u2588\x1b[0m

----------- coverage: platform linux, python 3.6.7-final-0 -----------
Name                Stmts   Miss Branch BrPart  Cover   Missing
---------------------------------------------------------------
polls/__init__.py       0      0      0      0   100%
polls/models.py         4      0      0      0   100%
polls/views.py          6      0      0      0   100%
---------------------------------------------------------------
TOTAL                  10      0      0      0   100%


Results (0.42s):
       4 passed
```
