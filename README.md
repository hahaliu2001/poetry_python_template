# poetry_python_template
Poetry python project template

## how to use mkdocs
1. add markfile into docs folder
2. change mkdocs.yml to add new file 
3. `mkdocs build ` to rebuild it
4. run it
    * `mkdocs serve` serving on 127.0.0.1:8000(default)
    * `mkdocs serve -a local_IP:port` serving on local_IP:port

## push docs to github gh-page
1. `mkdocs gh-deploy --clean` to push to github

2. visit https://{username}.github.io/{projectname} a few minutes later

    in this example, visit https://hahaliu2001.github.io/poetry_python_template/

