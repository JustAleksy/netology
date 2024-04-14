# Домашнее задание к занятию "Jenkins"

</details>  

## Подготовка к выполнению

1. Создать 2 VM: для jenkins-master и jenkins-agent.
2. Установить jenkins при помощи playbook'a.
3. Запустить и проверить работоспособность.
4. Сделать первоначальную настройку.

## Основная часть

1. Сделать Freestyle Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.

- <details><summary>Settings</summary>
            
    ![2024-04-10_22-28-14](https://github.com/JustAleksy/netology/assets/143338652/f24d1b18-39f0-4e93-b5be-971389b99613)

   <details>

- <details><summary>Лог</summary>
           
        ```log
        Started by user Кряжевских Алексей Александрович
        Running as SYSTEM
        Building remotely on agent (test) in workspace /opt/jenkins_agent/workspace/Freestyle
        [WS-CLEANUP] Deleting project workspace...
        [WS-CLEANUP] Deferred wipeout is used...
        [WS-CLEANUP] Done
        The recommended git tool is: NONE
        using credential 7510b6f3-1414-429f-9956-e109dfe0d728
        Cloning the remote Git repository
        Cloning repository https://github.com/JustAleksy/clickhouse.git
        > git init /opt/jenkins_agent/workspace/Freestyle # timeout=10
        Fetching upstream changes from https://github.com/JustAleksy/clickhouse.git
        > git --version # timeout=10
        > git --version # 'git version 1.8.3.1'
        using GIT_SSH to set credentials 
        [INFO] Currently running in a labeled security context
        [INFO] Currently SELinux is 'enforcing' on the host
        > /usr/bin/chcon --type=ssh_home_t /opt/jenkins_agent/workspace/Freestyle@tmp/jenkins-gitclient-ssh11420065910216740675.key
        Verifying host key using known hosts file
        You're using 'Known hosts file' strategy to verify ssh host keys, but your known_hosts file does not exist, please go to 'Manage Jenkins' -> 'Security' -> 'Git Host Key Verification Configuration' and configure host key verification.
        > git fetch --tags --progress https://github.com/JustAleksy/clickhouse.git +refs/heads/*:refs/remotes/origin/* # timeout=10
        > git config remote.origin.url https://github.com/JustAleksy/clickhouse.git # timeout=10
        > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
        Avoid second fetch
        > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
        Checking out Revision 1687e8f5749304bbf2534e633deee06281476d9a (refs/remotes/origin/master)
        > git config core.sparsecheckout # timeout=10
        > git checkout -f 1687e8f5749304bbf2534e633deee06281476d9a # timeout=10
        Commit message: "+requirments.txt."
        First time build. Skipping changelog.
        [Freestyle] $ /bin/sh -xe /tmp/jenkins12118560652738913000.sh
        + pip install -r requirements.txt
        Defaulting to user installation because normal site-packages is not writeable
        Collecting docker
        Downloading docker-5.0.3-py2.py3-none-any.whl (146 kB)
        Requirement already satisfied: ansible in /usr/local/lib/python3.6/site-packages (from -r requirements.txt (line 2)) (2.10.7)
        Collecting molecule
        Downloading molecule-3.6.1-py3-none-any.whl (241 kB)
        Collecting molecule-docker
        Downloading molecule_docker-1.1.0-py3-none-any.whl (16 kB)
        Collecting requests!=2.18.0,>=2.14.2
        Downloading requests-2.27.1-py2.py3-none-any.whl (63 kB)
        Collecting websocket-client>=0.32.0
        Downloading websocket_client-1.3.1-py3-none-any.whl (54 kB)
        Requirement already satisfied: ansible-base<2.11,>=2.10.5 in /usr/local/lib/python3.6/site-packages (from ansible->-r requirements.txt (line 2)) (2.10.17)
        Collecting importlib-metadata
        Downloading importlib_metadata-4.8.3-py3-none-any.whl (17 kB)
        Collecting enrich>=1.2.7
        Downloading enrich-1.2.7-py3-none-any.whl (8.7 kB)
        Collecting click-help-colors>=0.9
        Downloading click_help_colors-0.9.4-py3-none-any.whl (6.4 kB)
        Collecting cerberus!=1.3.3,!=1.3.4,>=1.3.1
        Downloading Cerberus-1.3.5-py3-none-any.whl (30 kB)
        Requirement already satisfied: Jinja2>=2.11.3 in /usr/local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (3.0.3)
        Collecting ansible-compat>=1.0.0
        Downloading ansible_compat-1.0.0-py3-none-any.whl (16 kB)
        Requirement already satisfied: packaging in /usr/local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (21.3)
        Collecting pluggy<2.0,>=0.7.1
        Downloading pluggy-1.0.0-py2.py3-none-any.whl (13 kB)
        Collecting click<9,>=8.0
        Downloading click-8.0.4-py3-none-any.whl (97 kB)
        Requirement already satisfied: PyYAML>=5.1 in /usr/local/lib64/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (6.0.1)
        Collecting paramiko<3,>=2.5.0
        Downloading paramiko-2.12.0-py2.py3-none-any.whl (213 kB)
        Collecting dataclasses
        Downloading dataclasses-0.8-py3-none-any.whl (19 kB)
        Collecting cookiecutter>=1.7.3
        Downloading cookiecutter-1.7.3-py2.py3-none-any.whl (34 kB)
        Collecting rich>=9.5.1
        Downloading rich-12.6.0-py3-none-any.whl (237 kB)
        Requirement already satisfied: selinux in /usr/local/lib/python3.6/site-packages (from molecule-docker->-r requirements.txt (line 4)) (0.2.1)
        Requirement already satisfied: cryptography in /usr/local/lib64/python3.6/site-packages (from ansible-base<2.11,>=2.10.5->ansible->-r requirements.txt (line 2)) (40.0.2)
        Collecting cached-property~=1.5
        Downloading cached_property-1.5.2-py2.py3-none-any.whl (7.6 kB)
        Collecting subprocess-tee>=0.3.5
        Downloading subprocess_tee-0.3.5-py3-none-any.whl (8.0 kB)
        Collecting python-slugify>=4.0.0
        Downloading python_slugify-6.1.2-py2.py3-none-any.whl (9.4 kB)
        Collecting poyo>=0.5.0
        Downloading poyo-0.5.0-py2.py3-none-any.whl (10 kB)
        Collecting binaryornot>=0.4.4
        Downloading binaryornot-0.4.4-py2.py3-none-any.whl (9.0 kB)
        Collecting jinja2-time>=0.2.0
        Downloading jinja2_time-0.2.0-py2.py3-none-any.whl (6.4 kB)
        Collecting six>=1.10
        Downloading six-1.16.0-py2.py3-none-any.whl (11 kB)
        Requirement already satisfied: MarkupSafe>=2.0 in /usr/local/lib64/python3.6/site-packages (from Jinja2>=2.11.3->molecule->-r requirements.txt (line 3)) (2.0.1)
        Collecting pynacl>=1.0.1
        Downloading PyNaCl-1.5.0-cp36-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (1.1 MB)
        Collecting bcrypt>=3.1.3
        Downloading bcrypt-4.0.1-cp36-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (593 kB)
        Collecting zipp>=0.5
        Downloading zipp-3.6.0-py3-none-any.whl (5.3 kB)
        Collecting typing-extensions>=3.6.4
        Downloading typing_extensions-4.1.1-py3-none-any.whl (26 kB)
        Collecting charset-normalizer~=2.0.0
        Downloading charset_normalizer-2.0.12-py3-none-any.whl (39 kB)
        Collecting certifi>=2017.4.17
        Downloading certifi-2024.2.2-py3-none-any.whl (163 kB)
        Collecting urllib3<1.27,>=1.21.1
        Downloading urllib3-1.26.18-py2.py3-none-any.whl (143 kB)
        Collecting idna<4,>=2.5
        Downloading idna-3.6-py3-none-any.whl (61 kB)
        Collecting commonmark<0.10.0,>=0.9.0
        Downloading commonmark-0.9.1-py2.py3-none-any.whl (51 kB)
        Collecting pygments<3.0.0,>=2.6.0
        Downloading Pygments-2.14.0-py3-none-any.whl (1.1 MB)
        Requirement already satisfied: pyparsing!=3.0.5,>=2.0.2 in /usr/local/lib/python3.6/site-packages (from packaging->molecule->-r requirements.txt (line 3)) (3.1.2)
        Requirement already satisfied: distro>=1.3.0 in /usr/local/lib/python3.6/site-packages (from selinux->molecule-docker->-r requirements.txt (line 4)) (1.9.0)
        Requirement already satisfied: setuptools>=39.0 in /usr/local/lib/python3.6/site-packages (from selinux->molecule-docker->-r requirements.txt (line 4)) (59.6.0)
        Collecting chardet>=3.0.2
        Downloading chardet-5.0.0-py3-none-any.whl (193 kB)
        Requirement already satisfied: cffi>=1.12 in /usr/local/lib64/python3.6/site-packages (from cryptography->ansible-base<2.11,>=2.10.5->ansible->-r requirements.txt (line 2)) (1.15.1)
        Collecting arrow
        Downloading arrow-1.2.3-py3-none-any.whl (66 kB)
        Collecting text-unidecode>=1.3
        Downloading text_unidecode-1.3-py2.py3-none-any.whl (78 kB)
        Requirement already satisfied: pycparser in /usr/local/lib/python3.6/site-packages (from cffi>=1.12->cryptography->ansible-base<2.11,>=2.10.5->ansible->-r requirements.txt (line 2)) (2.21)
        Collecting python-dateutil>=2.7.0
        Downloading python_dateutil-2.9.0.post0-py2.py3-none-any.whl (229 kB)
        Installing collected packages: six, zipp, typing-extensions, python-dateutil, urllib3, text-unidecode, pygments, importlib-metadata, idna, dataclasses, commonmark, charset-normalizer, chardet, certifi, arrow, subprocess-tee, rich, requests, python-slugify, pynacl, poyo, jinja2-time, click, cached-property, binaryornot, bcrypt, websocket-client, pluggy, paramiko, enrich, cookiecutter, click-help-colors, cerberus, ansible-compat, molecule, docker, molecule-docker
        Successfully installed ansible-compat-1.0.0 arrow-1.2.3 bcrypt-4.0.1 binaryornot-0.4.4 cached-property-1.5.2 cerberus-1.3.5 certifi-2024.2.2 chardet-5.0.0 charset-normalizer-2.0.12 click-8.0.4 click-help-colors-0.9.4 commonmark-0.9.1 cookiecutter-1.7.3 dataclasses-0.8 docker-5.0.3 enrich-1.2.7 idna-3.6 importlib-metadata-4.8.3 jinja2-time-0.2.0 molecule-3.6.1 molecule-docker-1.1.0 paramiko-2.12.0 pluggy-1.0.0 poyo-0.5.0 pygments-2.14.0 pynacl-1.5.0 python-dateutil-2.9.0.post0 python-slugify-6.1.2 requests-2.27.1 rich-12.6.0 six-1.16.0 subprocess-tee-0.3.5 text-unidecode-1.3 typing-extensions-4.1.1 urllib3-1.26.18 websocket-client-1.3.1 zipp-3.6.0
        + molecule test
        /usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
        from cryptography.exceptions import InvalidSignature
        /home/jenkins/.local/lib/python3.6/site-packages/requests/__init__.py:104: RequestsDependencyWarning: urllib3 (1.26.18) or chardet (5.0.0)/charset_normalizer (2.0.12) doesn't match a supported version!
        RequestsDependencyWarning)
        INFO     default scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
        INFO     Performing prerun...
        INFO     Set ANSIBLE_LIBRARY=/home/jenkins/.cache/ansible-compat/ec3a28/modules:/home/jenkins/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
        INFO     Set ANSIBLE_COLLECTIONS_PATH=/home/jenkins/.cache/ansible-compat/ec3a28/collections:/home/jenkins/.ansible/collections:/usr/share/ansible/collections
        INFO     Set ANSIBLE_ROLES_PATH=/home/jenkins/.cache/ansible-compat/ec3a28/roles:/home/jenkins/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
        ERROR    Computed fully qualified role name of Aleksei.Freestyle does not follow current galaxy requirements.
        Please edit meta/main.yml and assure we can correctly determine full role name:
        
        galaxy_info:
        role_name: my_name  # if absent directory name hosting role is used instead
        namespace: my_galaxy_namespace  # if absent, author is used instead
        
        Namespace: https://galaxy.ansible.com/docs/contributing/namespaces.html#galaxy-namespace-limitations
        Role: https://galaxy.ansible.com/docs/contributing/creating_role.html#role-names
        
        As an alternative, you can add 'role-name' to either skip_list or warn_list.
        
        Traceback (most recent call last):
        File "/home/jenkins/.local/bin/molecule", line 8, in <module>
            sys.exit(main())
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/core.py", line 1128, in __call__
            return self.main(*args, **kwargs)
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/core.py", line 1053, in main
            rv = self.invoke(ctx)
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/core.py", line 1659, in invoke
            return _process_result(sub_ctx.command.invoke(sub_ctx))
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/core.py", line 1395, in invoke
            return ctx.invoke(self.callback, **ctx.params)
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/core.py", line 754, in invoke
            return __callback(*args, **kwargs)
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/decorators.py", line 26, in new_func
            return f(get_current_context(), *args, **kwargs)
        File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/command/test.py", line 161, in test
            base.execute_cmdline_scenarios(scenario_name, args, command_args, ansible_args)
        File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/command/base.py", line 111, in execute_cmdline_scenarios
            scenario.config.runtime.prepare_environment(install_local=True)
        File "/home/jenkins/.local/lib/python3.6/site-packages/ansible_compat/runtime.py", line 334, in prepare_environment
            self._install_galaxy_role(self.project_dir, ignore_errors=True)
        File "/home/jenkins/.local/lib/python3.6/site-packages/ansible_compat/runtime.py", line 478, in _install_galaxy_role
            raise InvalidPrerequisiteError(msg)
        ansible_compat.errors.InvalidPrerequisiteError: Computed fully qualified role name of Aleksei.Freestyle does not follow current galaxy requirements.
        Please edit meta/main.yml and assure we can correctly determine full role name:
        
        galaxy_info:
        role_name: my_name  # if absent directory name hosting role is used instead
        namespace: my_galaxy_namespace  # if absent, author is used instead
        
        Namespace: https://galaxy.ansible.com/docs/contributing/namespaces.html#galaxy-namespace-limitations
        Role: https://galaxy.ansible.com/docs/contributing/creating_role.html#role-names
        
        As an alternative, you can add 'role-name' to either skip_list or warn_list.
        
        Build step 'Execute shell' marked build as failure
        Finished: FAILURE
        ```
        </details>

2. Сделать Declarative Pipeline Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.
- <details><summary>Результат</summary>
        
  ![Снимок экрана от 2024-04-10 22-36-26](https://github.com/JustAleksy/netology/assets/143338652/2246ae29-54f1-4dd6-b1a5-f9ed9a86cb74)
  <details>

- <details><summary>Settings</summary>
           
   ![2024-04-10_22-36-44](https://github.com/JustAleksy/netology/assets/143338652/8445f408-ad3d-4813-9aee-8e16a99ba861)
   <details>

- <details><summary>Лог</summary>

   ```log
        Started by user Кряжевских Алексей Александрович
        [Pipeline] Start of Pipeline
        [Pipeline] node
        Running on agent in /opt/jenkins_agent/workspace/Declarative
        [Pipeline] {
        [Pipeline] stage
        [Pipeline] { (Checkout)
        [Pipeline] git
        The recommended git tool is: NONE
        using credential a6975d34-7b75-451d-87ac-8ba8e6281fc1
        Cloning the remote Git repository
        Cloning repository https://github.com/JustAleksy/clickhouse.git
        > git init /opt/jenkins_agent/workspace/Declarative # timeout=10
        Fetching upstream changes from https://github.com/JustAleksy/clickhouse.git
        > git --version # timeout=10
        > git --version # 'git version 1.8.3.1'
        using GIT_SSH to set credentials 
        [INFO] Currently running in a labeled security context
        [INFO] Currently SELinux is 'enforcing' on the host
        > /usr/bin/chcon --type=ssh_home_t /opt/jenkins_agent/workspace/Declarative@tmp/jenkins-gitclient-ssh3992500618111927385.key
        Verifying host key using known hosts file
        You're using 'Known hosts file' strategy to verify ssh host keys, but your known_hosts file does not exist, please go to 'Manage Jenkins' -> 'Security' -> 'Git Host Key Verification Configuration' and configure host key verification.
        > git fetch --tags --progress https://github.com/JustAleksy/clickhouse.git +refs/heads/*:refs/remotes/origin/* # timeout=10
        Avoid second fetch
        Checking out Revision 1687e8f5749304bbf2534e633deee06281476d9a (refs/remotes/origin/master)
        Commit message: "+requirments.txt."
        First time build. Skipping changelog.
        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] stage
        > git config remote.origin.url https://github.com/JustAleksy/clickhouse.git # timeout=10
        > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
        > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
        > git config core.sparsecheckout # timeout=10
        > git checkout -f 1687e8f5749304bbf2534e633deee06281476d9a # timeout=10
        > git branch -a -v --no-abbrev # timeout=10
        > git checkout -b master 1687e8f5749304bbf2534e633deee06281476d9a # timeout=10
        [Pipeline] { (Install molecule)
        [Pipeline] sh
        + pip install -r requirements.txt
        Defaulting to user installation because normal site-packages is not writeable
        Requirement already satisfied: docker in /home/jenkins/.local/lib/python3.6/site-packages (from -r requirements.txt (line 1)) (5.0.3)
        Requirement already satisfied: ansible in /usr/local/lib/python3.6/site-packages (from -r requirements.txt (line 2)) (2.10.7)
        Requirement already satisfied: molecule in /home/jenkins/.local/lib/python3.6/site-packages (from -r requirements.txt (line 3)) (3.6.1)
        Requirement already satisfied: molecule-docker in /home/jenkins/.local/lib/python3.6/site-packages (from -r requirements.txt (line 4)) (1.1.0)
        Requirement already satisfied: requests!=2.18.0,>=2.14.2 in /home/jenkins/.local/lib/python3.6/site-packages (from docker->-r requirements.txt (line 1)) (2.27.1)
        Requirement already satisfied: websocket-client>=0.32.0 in /home/jenkins/.local/lib/python3.6/site-packages (from docker->-r requirements.txt (line 1)) (1.3.1)
        Requirement already satisfied: ansible-base<2.11,>=2.10.5 in /usr/local/lib/python3.6/site-packages (from ansible->-r requirements.txt (line 2)) (2.10.17)
        Requirement already satisfied: cerberus!=1.3.3,!=1.3.4,>=1.3.1 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (1.3.5)
        Requirement already satisfied: rich>=9.5.1 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (12.6.0)
        Requirement already satisfied: paramiko<3,>=2.5.0 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (2.12.0)
        Requirement already satisfied: click<9,>=8.0 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (8.0.4)
        Requirement already satisfied: enrich>=1.2.7 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (1.2.7)
        Requirement already satisfied: Jinja2>=2.11.3 in /usr/local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (3.0.3)
        Requirement already satisfied: packaging in /usr/local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (21.3)
        Requirement already satisfied: cookiecutter>=1.7.3 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (1.7.3)
        Requirement already satisfied: ansible-compat>=1.0.0 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (1.0.0)
        Requirement already satisfied: click-help-colors>=0.9 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (0.9.4)
        Requirement already satisfied: importlib-metadata in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (4.8.3)
        Requirement already satisfied: pluggy<2.0,>=0.7.1 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (1.0.0)
        Requirement already satisfied: PyYAML>=5.1 in /usr/local/lib64/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (6.0.1)
        Requirement already satisfied: dataclasses in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (0.8)
        Requirement already satisfied: selinux in /usr/local/lib/python3.6/site-packages (from molecule-docker->-r requirements.txt (line 4)) (0.2.1)
        Requirement already satisfied: cryptography in /usr/local/lib64/python3.6/site-packages (from ansible-base<2.11,>=2.10.5->ansible->-r requirements.txt (line 2)) (40.0.2)
        Requirement already satisfied: subprocess-tee>=0.3.5 in /home/jenkins/.local/lib/python3.6/site-packages (from ansible-compat>=1.0.0->molecule->-r requirements.txt (line 3)) (0.3.5)
        Requirement already satisfied: cached-property~=1.5 in /home/jenkins/.local/lib/python3.6/site-packages (from ansible-compat>=1.0.0->molecule->-r requirements.txt (line 3)) (1.5.2)
        Requirement already satisfied: binaryornot>=0.4.4 in /home/jenkins/.local/lib/python3.6/site-packages (from cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (0.4.4)
        Requirement already satisfied: jinja2-time>=0.2.0 in /home/jenkins/.local/lib/python3.6/site-packages (from cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (0.2.0)
        Requirement already satisfied: six>=1.10 in /home/jenkins/.local/lib/python3.6/site-packages (from cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (1.16.0)
        Requirement already satisfied: poyo>=0.5.0 in /home/jenkins/.local/lib/python3.6/site-packages (from cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (0.5.0)
        Requirement already satisfied: python-slugify>=4.0.0 in /home/jenkins/.local/lib/python3.6/site-packages (from cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (6.1.2)
        Requirement already satisfied: MarkupSafe>=2.0 in /usr/local/lib64/python3.6/site-packages (from Jinja2>=2.11.3->molecule->-r requirements.txt (line 3)) (2.0.1)
        Requirement already satisfied: bcrypt>=3.1.3 in /home/jenkins/.local/lib/python3.6/site-packages (from paramiko<3,>=2.5.0->molecule->-r requirements.txt (line 3)) (4.0.1)
        Requirement already satisfied: pynacl>=1.0.1 in /home/jenkins/.local/lib/python3.6/site-packages (from paramiko<3,>=2.5.0->molecule->-r requirements.txt (line 3)) (1.5.0)
        Requirement already satisfied: typing-extensions>=3.6.4 in /home/jenkins/.local/lib/python3.6/site-packages (from importlib-metadata->molecule->-r requirements.txt (line 3)) (4.1.1)
        Requirement already satisfied: zipp>=0.5 in /home/jenkins/.local/lib/python3.6/site-packages (from importlib-metadata->molecule->-r requirements.txt (line 3)) (3.6.0)
        Requirement already satisfied: urllib3<1.27,>=1.21.1 in /home/jenkins/.local/lib/python3.6/site-packages (from requests!=2.18.0,>=2.14.2->docker->-r requirements.txt (line 1)) (1.26.18)
        Requirement already satisfied: idna<4,>=2.5 in /home/jenkins/.local/lib/python3.6/site-packages (from requests!=2.18.0,>=2.14.2->docker->-r requirements.txt (line 1)) (3.6)
        Requirement already satisfied: charset-normalizer~=2.0.0 in /home/jenkins/.local/lib/python3.6/site-packages (from requests!=2.18.0,>=2.14.2->docker->-r requirements.txt (line 1)) (2.0.12)
        Requirement already satisfied: certifi>=2017.4.17 in /home/jenkins/.local/lib/python3.6/site-packages (from requests!=2.18.0,>=2.14.2->docker->-r requirements.txt (line 1)) (2024.2.2)
        Requirement already satisfied: pygments<3.0.0,>=2.6.0 in /home/jenkins/.local/lib/python3.6/site-packages (from rich>=9.5.1->molecule->-r requirements.txt (line 3)) (2.14.0)
        Requirement already satisfied: commonmark<0.10.0,>=0.9.0 in /home/jenkins/.local/lib/python3.6/site-packages (from rich>=9.5.1->molecule->-r requirements.txt (line 3)) (0.9.1)
        Requirement already satisfied: pyparsing!=3.0.5,>=2.0.2 in /usr/local/lib/python3.6/site-packages (from packaging->molecule->-r requirements.txt (line 3)) (3.1.2)
        Requirement already satisfied: distro>=1.3.0 in /usr/local/lib/python3.6/site-packages (from selinux->molecule-docker->-r requirements.txt (line 4)) (1.9.0)
        Requirement already satisfied: setuptools>=39.0 in /usr/local/lib/python3.6/site-packages (from selinux->molecule-docker->-r requirements.txt (line 4)) (59.6.0)
        Requirement already satisfied: chardet>=3.0.2 in /home/jenkins/.local/lib/python3.6/site-packages (from binaryornot>=0.4.4->cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (5.0.0)
        Requirement already satisfied: cffi>=1.12 in /usr/local/lib64/python3.6/site-packages (from cryptography->ansible-base<2.11,>=2.10.5->ansible->-r requirements.txt (line 2)) (1.15.1)
        Requirement already satisfied: arrow in /home/jenkins/.local/lib/python3.6/site-packages (from jinja2-time>=0.2.0->cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (1.2.3)
        Requirement already satisfied: text-unidecode>=1.3 in /home/jenkins/.local/lib/python3.6/site-packages (from python-slugify>=4.0.0->cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (1.3)
        Requirement already satisfied: pycparser in /usr/local/lib/python3.6/site-packages (from cffi>=1.12->cryptography->ansible-base<2.11,>=2.10.5->ansible->-r requirements.txt (line 2)) (2.21)
        Requirement already satisfied: python-dateutil>=2.7.0 in /home/jenkins/.local/lib/python3.6/site-packages (from arrow->jinja2-time>=0.2.0->cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (2.9.0.post0)
        [Pipeline] sh
        + echo help
        help
        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] stage
        [Pipeline] { (Run Molecule)
        [Pipeline] sh
        + molecule test
        /usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
        from cryptography.exceptions import InvalidSignature
        /home/jenkins/.local/lib/python3.6/site-packages/requests/__init__.py:104: RequestsDependencyWarning: urllib3 (1.26.18) or chardet (5.0.0)/charset_normalizer (2.0.12) doesn't match a supported version!
        RequestsDependencyWarning)
        INFO     default scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
        INFO     Performing prerun...
        INFO     Set ANSIBLE_LIBRARY=/home/jenkins/.cache/ansible-compat/39f1eb/modules:/home/jenkins/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
        INFO     Set ANSIBLE_COLLECTIONS_PATH=/home/jenkins/.cache/ansible-compat/39f1eb/collections:/home/jenkins/.ansible/collections:/usr/share/ansible/collections
        INFO     Set ANSIBLE_ROLES_PATH=/home/jenkins/.cache/ansible-compat/39f1eb/roles:/home/jenkins/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
        ERROR    Computed fully qualified role name of Aleksei.Declarative does not follow current galaxy requirements.
        Please edit meta/main.yml and assure we can correctly determine full role name:

        galaxy_info:
        role_name: my_name  # if absent directory name hosting role is used instead
        namespace: my_galaxy_namespace  # if absent, author is used instead

        Namespace: https://galaxy.ansible.com/docs/contributing/namespaces.html#galaxy-namespace-limitations
        Role: https://galaxy.ansible.com/docs/contributing/creating_role.html#role-names

        As an alternative, you can add 'role-name' to either skip_list or warn_list.

        Traceback (most recent call last):
        File "/home/jenkins/.local/bin/molecule", line 8, in <module>
        sys.exit(main())
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/core.py", line 1128, in __call__
        return self.main(*args, **kwargs)
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/core.py", line 1053, in main
        rv = self.invoke(ctx)
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/core.py", line 1659, in invoke
        return _process_result(sub_ctx.command.invoke(sub_ctx))
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/core.py", line 1395, in invoke
        return ctx.invoke(self.callback, **ctx.params)
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/core.py", line 754, in invoke
        return __callback(*args, **kwargs)
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/decorators.py", line 26, in new_func
        return f(get_current_context(), *args, **kwargs)
        File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/command/test.py", line 161, in test
        base.execute_cmdline_scenarios(scenario_name, args, command_args, ansible_args)
        File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/command/base.py", line 111, in execute_cmdline_scenarios
        scenario.config.runtime.prepare_environment(install_local=True)
        File "/home/jenkins/.local/lib/python3.6/site-packages/ansible_compat/runtime.py", line 334, in prepare_environment
        self._install_galaxy_role(self.project_dir, ignore_errors=True)
        File "/home/jenkins/.local/lib/python3.6/site-packages/ansible_compat/runtime.py", line 478, in _install_galaxy_role
        raise InvalidPrerequisiteError(msg)
        ansible_compat.errors.InvalidPrerequisiteError: Computed fully qualified role name of Aleksei.Declarative does not follow current galaxy requirements.
        Please edit meta/main.yml and assure we can correctly determine full role name:

        galaxy_info:
        role_name: my_name  # if absent directory name hosting role is used instead
        namespace: my_galaxy_namespace  # if absent, author is used instead

        Namespace: https://galaxy.ansible.com/docs/contributing/namespaces.html#galaxy-namespace-limitations
        Role: https://galaxy.ansible.com/docs/contributing/creating_role.html#role-names

        As an alternative, you can add 'role-name' to either skip_list or warn_list.

        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] }
        [Pipeline] // node
        [Pipeline] End of Pipeline
        ERROR: script returned exit code 1
        Finished: FAILURE
        ```

        </details>

3. Перенести Declarative Pipeline в репозиторий в файл `Jenkinsfile`.

    https://github.com/JustAleksy/netology/blob/master/CI_CD/Jenkins/pipeline/Jenkinsfile

4. Создать Multibranch Pipeline на запуск `Jenkinsfile` из репозитория.

- <details><summary>Результат</summary>
        
  ![Снимок экрана от 2024-04-10 22-50-31](https://github.com/JustAleksy/netology/assets/143338652/0dfa9bcb-7781-4d3f-9ad4-9e005570e250)
  <details>

- <details><summary>Settings</summary>
      
  ![2024-04-10_22-51-07](https://github.com/JustAleksy/netology/assets/143338652/3f74a7b0-3a0a-4a8c-ae2a-ca7a2be4f337)
  <details>

- <details><summary>Scan Multibranch Pipeline Log</summary>

        ```log
        Started by timer
        [Wed Apr 10 20:20:06 UTC 2024] Starting branch indexing...
        > git --version # timeout=10
        > git --version # 'git version 1.8.3.1'
        using GIT_SSH to set credentials 
        [INFO] Currently running in a labeled security context
        [INFO] Currently SELinux is 'enforcing' on the host
        > /usr/bin/chcon --type=ssh_home_t /tmp/jenkins-gitclient-ssh10644714602159576607.key
        Verifying host key using known hosts file
        > git ls-remote https://github.com/JustAleksy/clickhouse.git # timeout=10
        > git rev-parse --resolve-git-dir /var/lib/jenkins/caches/git-5cc7b408f2f8831c898cf97e9b23ac78/.git # timeout=10
        Setting origin to https://github.com/JustAleksy/clickhouse.git
        > git config remote.origin.url https://github.com/JustAleksy/clickhouse.git # timeout=10
        Fetching & pruning origin...
        Listing remote references...
        > git config --get remote.origin.url # timeout=10
        > git --version # timeout=10
        > git --version # 'git version 1.8.3.1'
        using GIT_SSH to set credentials 
        [INFO] Currently running in a labeled security context
        [INFO] Currently SELinux is 'enforcing' on the host
        > /usr/bin/chcon --type=ssh_home_t /var/lib/jenkins/caches/git-5cc7b408f2f8831c898cf97e9b23ac78@tmp/jenkins-gitclient-ssh16999341144318284985.key
        Verifying host key using known hosts file
        > git ls-remote -h https://github.com/JustAleksy/clickhouse.git # timeout=10
        Fetching upstream changes from origin
        > git config --get remote.origin.url # timeout=10
        using GIT_SSH to set credentials 
        [INFO] Currently running in a labeled security context
        [INFO] Currently SELinux is 'enforcing' on the host
        > /usr/bin/chcon --type=ssh_home_t /var/lib/jenkins/caches/git-5cc7b408f2f8831c898cf97e9b23ac78@tmp/jenkins-gitclient-ssh4226230919483241823.key
        Verifying host key using known hosts file
        > git fetch --tags --progress --prune origin +refs/heads/*:refs/remotes/origin/* # timeout=10
        Checking branches...
        Checking branch master
            ‘Jenkinsfile’ found
            Met criteria
        No changes detected: master (still at a2d978256e41d436f8af1d41834e18b3ce2a2f1a)
        Processed 1 branches
        [Wed Apr 10 20:20:08 UTC 2024] Finished branch indexing. Indexing took 1.5 sec
        Finished: SUCCESS
        ```

        </details>

- <details><summary>Console Output</summary>

        ```log
        Branch indexing
        > git rev-parse --resolve-git-dir /var/lib/jenkins/caches/git-5cc7b408f2f8831c898cf97e9b23ac78/.git # timeout=10
        Setting origin to https://github.com/JustAleksy/clickhouse.git
        > git config remote.origin.url https://github.com/JustAleksy/clickhouse.git # timeout=10
        Fetching origin...
        Fetching upstream changes from origin
        > git --version # timeout=10
        > git --version # 'git version 1.8.3.1'
        > git config --get remote.origin.url # timeout=10
        using GIT_SSH to set credentials 
        [INFO] Currently running in a labeled security context
        [INFO] Currently SELinux is 'enforcing' on the host
        > /usr/bin/chcon --type=ssh_home_t /var/lib/jenkins/caches/git-5cc7b408f2f8831c898cf97e9b23ac78@tmp/jenkins-gitclient-ssh12432411636415169520.key
        Verifying host key using known hosts file
        > git fetch --tags --progress origin +refs/heads/*:refs/remotes/origin/* # timeout=10
        Seen branch in repository origin/master
        Seen 1 remote branch
        Obtained Jenkinsfile from a2d978256e41d436f8af1d41834e18b3ce2a2f1a
        [Pipeline] Start of Pipeline
        [Pipeline] node
        Running on agent in /opt/jenkins_agent/workspace/multibranch_master
        [Pipeline] {
        [Pipeline] stage
        [Pipeline] { (Declarative: Checkout SCM)
        [Pipeline] checkout
        The recommended git tool is: git
        using credential a6975d34-7b75-451d-87ac-8ba8e6281fc1
        Cloning the remote Git repository
        Avoid fetching tags
        Cloning repository https://github.com/JustAleksy/clickhouse.git
        > git init /opt/jenkins_agent/workspace/multibranch_master # timeout=10
        [WARNING] Reference path does not exist: clickhouse
        Fetching upstream changes from https://github.com/JustAleksy/clickhouse.git
        > git --version # timeout=10
        > git --version # 'git version 1.8.3.1'
        using GIT_SSH to set credentials 
        [INFO] Currently running in a labeled security context
        [INFO] Currently SELinux is 'enforcing' on the host
        > /usr/bin/chcon --type=ssh_home_t /opt/jenkins_agent/workspace/multibranch_master@tmp/jenkins-gitclient-ssh5079224258922551411.key
        Verifying host key using known hosts file
        You're using 'Known hosts file' strategy to verify ssh host keys, but your known_hosts file does not exist, please go to 'Manage Jenkins' -> 'Security' -> 'Git Host Key Verification Configuration' and configure host key verification.
        > git fetch --no-tags --progress https://github.com/JustAleksy/clickhouse.git +refs/heads/*:refs/remotes/origin/* # timeout=10
        Avoid second fetch
        Checking out Revision a2d978256e41d436f8af1d41834e18b3ce2a2f1a (master)
        Commit message: "+Jenkinsfile"
        First time build. Skipping changelog.
        [Pipeline] }
        [Pipeline] // stage
        > git config remote.origin.url https://github.com/JustAleksy/clickhouse.git # timeout=10
        > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
        > git config core.sparsecheckout # timeout=10
        > git checkout -f a2d978256e41d436f8af1d41834e18b3ce2a2f1a # timeout=10
        [Pipeline] withEnv
        [Pipeline] {
        [Pipeline] stage
        [Pipeline] { (Checkout)
        [Pipeline] git
        The recommended git tool is: git
        using credential a6975d34-7b75-451d-87ac-8ba8e6281fc1
        Fetching changes from the remote Git repository
        > git rev-parse --resolve-git-dir /opt/jenkins_agent/workspace/multibranch_master/.git # timeout=10
        > git config remote.origin.url https://github.com/JustAleksy/clickhouse.git # timeout=10
        Fetching upstream changes from https://github.com/JustAleksy/clickhouse.git
        > git --version # timeout=10
        > git --version # 'git version 1.8.3.1'
        using GIT_SSH to set credentials 
        [INFO] Currently running in a labeled security context
        [INFO] Currently SELinux is 'enforcing' on the host
        > /usr/bin/chcon --type=ssh_home_t /opt/jenkins_agent/workspace/multibranch_master@tmp/jenkins-gitclient-ssh10659550953453935897.key
        Verifying host key using known hosts file
        You're using 'Known hosts file' strategy to verify ssh host keys, but your known_hosts file does not exist, please go to 'Manage Jenkins' -> 'Security' -> 'Git Host Key Verification Configuration' and configure host key verification.
        > git fetch --tags --progress https://github.com/JustAleksy/clickhouse.git +refs/heads/*:refs/remotes/origin/* # timeout=10
        Checking out Revision a2d978256e41d436f8af1d41834e18b3ce2a2f1a (refs/remotes/origin/master)
        Commit message: "+Jenkinsfile"
        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] stage
        [Pipeline] { (Install molecule)
        [Pipeline] sh
        > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
        > git config core.sparsecheckout # timeout=10
        > git checkout -f a2d978256e41d436f8af1d41834e18b3ce2a2f1a # timeout=10
        > git branch -a -v --no-abbrev # timeout=10
        > git checkout -b master a2d978256e41d436f8af1d41834e18b3ce2a2f1a # timeout=10
        + pip install -r requirements.txt
        Defaulting to user installation because normal site-packages is not writeable
        Requirement already satisfied: docker in /home/jenkins/.local/lib/python3.6/site-packages (from -r requirements.txt (line 1)) (5.0.3)
        Requirement already satisfied: ansible in /usr/local/lib/python3.6/site-packages (from -r requirements.txt (line 2)) (2.10.7)
        Requirement already satisfied: molecule in /home/jenkins/.local/lib/python3.6/site-packages (from -r requirements.txt (line 3)) (3.6.1)
        Requirement already satisfied: molecule-docker in /home/jenkins/.local/lib/python3.6/site-packages (from -r requirements.txt (line 4)) (1.1.0)
        Requirement already satisfied: websocket-client>=0.32.0 in /home/jenkins/.local/lib/python3.6/site-packages (from docker->-r requirements.txt (line 1)) (1.3.1)
        Requirement already satisfied: requests!=2.18.0,>=2.14.2 in /home/jenkins/.local/lib/python3.6/site-packages (from docker->-r requirements.txt (line 1)) (2.27.1)
        Requirement already satisfied: ansible-base<2.11,>=2.10.5 in /usr/local/lib/python3.6/site-packages (from ansible->-r requirements.txt (line 2)) (2.10.17)
        Requirement already satisfied: cookiecutter>=1.7.3 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (1.7.3)
        Requirement already satisfied: enrich>=1.2.7 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (1.2.7)
        Requirement already satisfied: PyYAML>=5.1 in /usr/local/lib64/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (6.0.1)
        Requirement already satisfied: paramiko<3,>=2.5.0 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (2.12.0)
        Requirement already satisfied: rich>=9.5.1 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (12.6.0)
        Requirement already satisfied: ansible-compat>=1.0.0 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (1.0.0)
        Requirement already satisfied: dataclasses in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (0.8)
        Requirement already satisfied: pluggy<2.0,>=0.7.1 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (1.0.0)
        Requirement already satisfied: packaging in /usr/local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (21.3)
        Requirement already satisfied: click-help-colors>=0.9 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (0.9.4)
        Requirement already satisfied: Jinja2>=2.11.3 in /usr/local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (3.0.3)
        Requirement already satisfied: cerberus!=1.3.3,!=1.3.4,>=1.3.1 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (1.3.5)
        Requirement already satisfied: importlib-metadata in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (4.8.3)
        Requirement already satisfied: click<9,>=8.0 in /home/jenkins/.local/lib/python3.6/site-packages (from molecule->-r requirements.txt (line 3)) (8.0.4)
        Requirement already satisfied: selinux in /usr/local/lib/python3.6/site-packages (from molecule-docker->-r requirements.txt (line 4)) (0.2.1)
        Requirement already satisfied: cryptography in /usr/local/lib64/python3.6/site-packages (from ansible-base<2.11,>=2.10.5->ansible->-r requirements.txt (line 2)) (40.0.2)
        Requirement already satisfied: cached-property~=1.5 in /home/jenkins/.local/lib/python3.6/site-packages (from ansible-compat>=1.0.0->molecule->-r requirements.txt (line 3)) (1.5.2)
        Requirement already satisfied: subprocess-tee>=0.3.5 in /home/jenkins/.local/lib/python3.6/site-packages (from ansible-compat>=1.0.0->molecule->-r requirements.txt (line 3)) (0.3.5)
        Requirement already satisfied: jinja2-time>=0.2.0 in /home/jenkins/.local/lib/python3.6/site-packages (from cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (0.2.0)
        Requirement already satisfied: python-slugify>=4.0.0 in /home/jenkins/.local/lib/python3.6/site-packages (from cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (6.1.2)
        Requirement already satisfied: poyo>=0.5.0 in /home/jenkins/.local/lib/python3.6/site-packages (from cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (0.5.0)
        Requirement already satisfied: six>=1.10 in /home/jenkins/.local/lib/python3.6/site-packages (from cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (1.16.0)
        Requirement already satisfied: binaryornot>=0.4.4 in /home/jenkins/.local/lib/python3.6/site-packages (from cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (0.4.4)
        Requirement already satisfied: MarkupSafe>=2.0 in /usr/local/lib64/python3.6/site-packages (from Jinja2>=2.11.3->molecule->-r requirements.txt (line 3)) (2.0.1)
        Requirement already satisfied: bcrypt>=3.1.3 in /home/jenkins/.local/lib/python3.6/site-packages (from paramiko<3,>=2.5.0->molecule->-r requirements.txt (line 3)) (4.0.1)
        Requirement already satisfied: pynacl>=1.0.1 in /home/jenkins/.local/lib/python3.6/site-packages (from paramiko<3,>=2.5.0->molecule->-r requirements.txt (line 3)) (1.5.0)
        Requirement already satisfied: zipp>=0.5 in /home/jenkins/.local/lib/python3.6/site-packages (from importlib-metadata->molecule->-r requirements.txt (line 3)) (3.6.0)
        Requirement already satisfied: typing-extensions>=3.6.4 in /home/jenkins/.local/lib/python3.6/site-packages (from importlib-metadata->molecule->-r requirements.txt (line 3)) (4.1.1)
        Requirement already satisfied: urllib3<1.27,>=1.21.1 in /home/jenkins/.local/lib/python3.6/site-packages (from requests!=2.18.0,>=2.14.2->docker->-r requirements.txt (line 1)) (1.26.18)
        Requirement already satisfied: certifi>=2017.4.17 in /home/jenkins/.local/lib/python3.6/site-packages (from requests!=2.18.0,>=2.14.2->docker->-r requirements.txt (line 1)) (2024.2.2)
        Requirement already satisfied: charset-normalizer~=2.0.0 in /home/jenkins/.local/lib/python3.6/site-packages (from requests!=2.18.0,>=2.14.2->docker->-r requirements.txt (line 1)) (2.0.12)
        Requirement already satisfied: idna<4,>=2.5 in /home/jenkins/.local/lib/python3.6/site-packages (from requests!=2.18.0,>=2.14.2->docker->-r requirements.txt (line 1)) (3.6)
        Requirement already satisfied: commonmark<0.10.0,>=0.9.0 in /home/jenkins/.local/lib/python3.6/site-packages (from rich>=9.5.1->molecule->-r requirements.txt (line 3)) (0.9.1)
        Requirement already satisfied: pygments<3.0.0,>=2.6.0 in /home/jenkins/.local/lib/python3.6/site-packages (from rich>=9.5.1->molecule->-r requirements.txt (line 3)) (2.14.0)
        Requirement already satisfied: pyparsing!=3.0.5,>=2.0.2 in /usr/local/lib/python3.6/site-packages (from packaging->molecule->-r requirements.txt (line 3)) (3.1.2)
        Requirement already satisfied: distro>=1.3.0 in /usr/local/lib/python3.6/site-packages (from selinux->molecule-docker->-r requirements.txt (line 4)) (1.9.0)
        Requirement already satisfied: setuptools>=39.0 in /usr/local/lib/python3.6/site-packages (from selinux->molecule-docker->-r requirements.txt (line 4)) (59.6.0)
        Requirement already satisfied: chardet>=3.0.2 in /home/jenkins/.local/lib/python3.6/site-packages (from binaryornot>=0.4.4->cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (5.0.0)
        Requirement already satisfied: cffi>=1.12 in /usr/local/lib64/python3.6/site-packages (from cryptography->ansible-base<2.11,>=2.10.5->ansible->-r requirements.txt (line 2)) (1.15.1)
        Requirement already satisfied: arrow in /home/jenkins/.local/lib/python3.6/site-packages (from jinja2-time>=0.2.0->cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (1.2.3)
        Requirement already satisfied: text-unidecode>=1.3 in /home/jenkins/.local/lib/python3.6/site-packages (from python-slugify>=4.0.0->cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (1.3)
        Requirement already satisfied: pycparser in /usr/local/lib/python3.6/site-packages (from cffi>=1.12->cryptography->ansible-base<2.11,>=2.10.5->ansible->-r requirements.txt (line 2)) (2.21)
        Requirement already satisfied: python-dateutil>=2.7.0 in /home/jenkins/.local/lib/python3.6/site-packages (from arrow->jinja2-time>=0.2.0->cookiecutter>=1.7.3->molecule->-r requirements.txt (line 3)) (2.9.0.post0)
        [Pipeline] sh
        + echo help
        help
        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] stage
        [Pipeline] { (Run Molecule)
        [Pipeline] sh
        + molecule test
        /usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
        from cryptography.exceptions import InvalidSignature
        /home/jenkins/.local/lib/python3.6/site-packages/requests/__init__.py:104: RequestsDependencyWarning: urllib3 (1.26.18) or chardet (5.0.0)/charset_normalizer (2.0.12) doesn't match a supported version!
        RequestsDependencyWarning)
        INFO     default scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
        INFO     Performing prerun...
        INFO     Set ANSIBLE_LIBRARY=/home/jenkins/.cache/ansible-compat/2593b8/modules:/home/jenkins/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
        INFO     Set ANSIBLE_COLLECTIONS_PATH=/home/jenkins/.cache/ansible-compat/2593b8/collections:/home/jenkins/.ansible/collections:/usr/share/ansible/collections
        INFO     Set ANSIBLE_ROLES_PATH=/home/jenkins/.cache/ansible-compat/2593b8/roles:/home/jenkins/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
        ERROR    Computed fully qualified role name of Aleksei.multibranch_master does not follow current galaxy requirements.
        Please edit meta/main.yml and assure we can correctly determine full role name:

        galaxy_info:
        role_name: my_name  # if absent directory name hosting role is used instead
        namespace: my_galaxy_namespace  # if absent, author is used instead

        Namespace: https://galaxy.ansible.com/docs/contributing/namespaces.html#galaxy-namespace-limitations
        Role: https://galaxy.ansible.com/docs/contributing/creating_role.html#role-names

        As an alternative, you can add 'role-name' to either skip_list or warn_list.

        Traceback (most recent call last):
        File "/home/jenkins/.local/bin/molecule", line 8, in <module>
            sys.exit(main())
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/core.py", line 1128, in __call__
            return self.main(*args, **kwargs)
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/core.py", line 1053, in main
            rv = self.invoke(ctx)
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/core.py", line 1659, in invoke
            return _process_result(sub_ctx.command.invoke(sub_ctx))
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/core.py", line 1395, in invoke
            return ctx.invoke(self.callback, **ctx.params)
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/core.py", line 754, in invoke
            return __callback(*args, **kwargs)
        File "/home/jenkins/.local/lib/python3.6/site-packages/click/decorators.py", line 26, in new_func
            return f(get_current_context(), *args, **kwargs)
        File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/command/test.py", line 161, in test
            base.execute_cmdline_scenarios(scenario_name, args, command_args, ansible_args)
        File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/command/base.py", line 111, in execute_cmdline_scenarios
            scenario.config.runtime.prepare_environment(install_local=True)
        File "/home/jenkins/.local/lib/python3.6/site-packages/ansible_compat/runtime.py", line 334, in prepare_environment
            self._install_galaxy_role(self.project_dir, ignore_errors=True)
        File "/home/jenkins/.local/lib/python3.6/site-packages/ansible_compat/runtime.py", line 478, in _install_galaxy_role
            raise InvalidPrerequisiteError(msg)
        ansible_compat.errors.InvalidPrerequisiteError: Computed fully qualified role name of Aleksei.multibranch_master does not follow current galaxy requirements.
        Please edit meta/main.yml and assure we can correctly determine full role name:

        galaxy_info:
        role_name: my_name  # if absent directory name hosting role is used instead
        namespace: my_galaxy_namespace  # if absent, author is used instead

        Namespace: https://galaxy.ansible.com/docs/contributing/namespaces.html#galaxy-namespace-limitations
        Role: https://galaxy.ansible.com/docs/contributing/creating_role.html#role-names

        As an alternative, you can add 'role-name' to either skip_list or warn_list.

        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] }
        [Pipeline] // withEnv
        [Pipeline] }
        [Pipeline] // node
        [Pipeline] End of Pipeline
        ERROR: script returned exit code 1
        Finished: FAILURE
        ```

        </details>

5. Создать Scripted Pipeline, наполнить его скриптом из pipeline.
   
6. Внести необходимые изменения, чтобы Pipeline запускал `ansible-playbook` без флагов `--check --diff`, если не установлен параметр при запуске джобы (prod_run = True), по умолчанию параметр имеет значение False и запускает прогон с флагами `--check --diff`.
   
- <details><summary>Fixed Pipeline</summary>
        
        ```groovy
        pipeline {
            agent { node { label 'agent' } }
            parameters {
                booleanParam(defaultValue: false, description: 'Run in production mode without --check --diff', name: 'prod_run')
            }
            stages {
                stage('Git checkout') {
                    steps {
                        git branch: 'master', credentialsId: 'a6975d34-7b75-451d-87ac-8ba8e6281fc1', url: 'https://github.com/JustAleksy/example-playbook.git'
                    }
                }
                stage('Sample define secret_check') {
                    steps {
                        script {
                            secret_check = true
                        }
                    }
                }
                stage('Run playbook') {
                    steps {
                        script {
                            if (secret_check) {
                                if (params.prod_run) {
                                    sh 'ansible-playbook site.yml -i inventory/prod.yml'
                                } else {
                                    sh 'ansible-playbook site.yml -i inventory/prod.yml --check --diff'
                                }
                            } else {
                                echo 'need more action'
                            }
                        }
                    }
                }
            }
        }
        ```
        <details>
        
7. Проверить работоспособность, исправить ошибки, исправленный Pipeline вложить в репозиторий в файл `ScriptedJenkinsfile`.

    - `prod_run=false`

        <details><summary>Лог</summary>

        ```log
        Started by user Кряжевских Алексей Александрович
        [Pipeline] Start of Pipeline
        [Pipeline] node
        Running on agent in /opt/jenkins_agent/workspace/Scripted
        [Pipeline] {
        [Pipeline] stage
        [Pipeline] { (Git checkout)
        [Pipeline] git
        The recommended git tool is: NONE
        using credential a6975d34-7b75-451d-87ac-8ba8e6281fc1
        Fetching changes from the remote Git repository
        Checking out Revision 20bd8d945340bb742acdd9e8c1a8fb5b73cc1700 (refs/remotes/origin/master)
        Commit message: "Merge branch 'master' of https://github.com/aragastmatb/example-playbook"
        > git rev-parse --resolve-git-dir /opt/jenkins_agent/workspace/Scripted/.git # timeout=10
        > git config remote.origin.url https://github.com/JustAleksy/example-playbook.git # timeout=10
        Fetching upstream changes from https://github.com/JustAleksy/example-playbook.git
        > git --version # timeout=10
        > git --version # 'git version 1.8.3.1'
        using GIT_SSH to set credentials 
        [INFO] Currently running in a labeled security context
        [INFO] Currently SELinux is 'enforcing' on the host
        > /usr/bin/chcon --type=ssh_home_t /opt/jenkins_agent/workspace/Scripted@tmp/jenkins-gitclient-ssh16507069773052519257.key
        Verifying host key using known hosts file
        You're using 'Known hosts file' strategy to verify ssh host keys, but your known_hosts file does not exist, please go to 'Manage Jenkins' -> 'Security' -> 'Git Host Key Verification Configuration' and configure host key verification.
        > git fetch --tags --progress https://github.com/JustAleksy/example-playbook.git +refs/heads/*:refs/remotes/origin/* # timeout=10
        > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
        > git config core.sparsecheckout # timeout=10
        > git checkout -f 20bd8d945340bb742acdd9e8c1a8fb5b73cc1700 # timeout=10
        > git branch -a -v --no-abbrev # timeout=10
        > git branch -D master # timeout=10
        > git checkout -b master 20bd8d945340bb742acdd9e8c1a8fb5b73cc1700 # timeout=10
        > git rev-list --no-walk 20bd8d945340bb742acdd9e8c1a8fb5b73cc1700 # timeout=10
        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] stage
        [Pipeline] { (Sample define secret_check)
        [Pipeline] script
        [Pipeline] {
        [Pipeline] }
        [Pipeline] // script
        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] stage
        [Pipeline] { (Run playbook)
        [Pipeline] script
        [Pipeline] {
        [Pipeline] sh
        + ansible-playbook site.yml -i inventory/prod.yml --check --diff

        PLAY [Install Java] ************************************************************

        TASK [Gathering Facts] *********************************************************
        /usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
        from cryptography.exceptions import InvalidSignature
        ok: [localhost]

        TASK [java : Upload .tar.gz file containing binaries from local storage] *******
        skipping: [localhost]

        TASK [java : Upload .tar.gz file conaining binaries from remote storage] *******
        ok: [localhost]

        TASK [java : Ensure installation dir exists] ***********************************
        fatal: [localhost]: FAILED! => {"changed": false, "module_stderr": "sudo: a password is required\n", "module_stdout": "", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 1}

        PLAY RECAP *********************************************************************
        localhost                  : ok=2    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0   

        [Pipeline] }
        [Pipeline] // script
        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] }
        [Pipeline] // node
        [Pipeline] End of Pipeline
        ERROR: script returned exit code 2
        Finished: FAILURE
        ```

        </details>

    - `prod_run=true`

        <details><summary>Лог</summary>

        ```log
        Started by user Кряжевских Алексей Александрович
        [Pipeline] Start of Pipeline
        [Pipeline] node
        Running on agent in /opt/jenkins_agent/workspace/Scripted
        [Pipeline] {
        [Pipeline] stage
        [Pipeline] { (Git checkout)
        [Pipeline] git
        The recommended git tool is: NONE
        using credential a6975d34-7b75-451d-87ac-8ba8e6281fc1
        Fetching changes from the remote Git repository
        > git rev-parse --resolve-git-dir /opt/jenkins_agent/workspace/Scripted/.git # timeout=10
        > git config remote.origin.url https://github.com/JustAleksy/example-playbook.git # timeout=10
        Fetching upstream changes from https://github.com/JustAleksy/example-playbook.git
        > git --version # timeout=10
        > git --version # 'git version 1.8.3.1'
        using GIT_SSH to set credentials 
        [INFO] Currently running in a labeled security context
        [INFO] Currently SELinux is 'enforcing' on the host
        > /usr/bin/chcon --type=ssh_home_t /opt/jenkins_agent/workspace/Scripted@tmp/jenkins-gitclient-ssh18194739599536232991.key
        Verifying host key using known hosts file
        You're using 'Known hosts file' strategy to verify ssh host keys, but your known_hosts file does not exist, please go to 'Manage Jenkins' -> 'Security' -> 'Git Host Key Verification Configuration' and configure host key verification.
        > git fetch --tags --progress https://github.com/JustAleksy/example-playbook.git +refs/heads/*:refs/remotes/origin/* # timeout=10
        Checking out Revision 20bd8d945340bb742acdd9e8c1a8fb5b73cc1700 (refs/remotes/origin/master)
        > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
        > git config core.sparsecheckout # timeout=10
        > git checkout -f 20bd8d945340bb742acdd9e8c1a8fb5b73cc1700 # timeout=10
        > git branch -a -v --no-abbrev # timeout=10
        > git checkout -b master 20bd8d945340bb742acdd9e8c1a8fb5b73cc1700 # timeout=10
        Commit message: "Merge branch 'master' of https://github.com/aragastmatb/example-playbook"
        First time build. Skipping changelog.
        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] stage
        [Pipeline] { (Sample define secret_check)
        [Pipeline] script
        [Pipeline] {
        [Pipeline] }
        [Pipeline] // script
        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] stage
        [Pipeline] { (Run playbook)
        [Pipeline] script
        [Pipeline] {
        [Pipeline] sh
        + ansible-playbook site.yml -i inventory/prod.yml

        PLAY [Install Java] ************************************************************

        TASK [Gathering Facts] *********************************************************
        /usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
        from cryptography.exceptions import InvalidSignature
        ok: [localhost]

        TASK [java : Upload .tar.gz file containing binaries from local storage] *******
        skipping: [localhost]

        TASK [java : Upload .tar.gz file conaining binaries from remote storage] *******
        changed: [localhost]

        TASK [java : Ensure installation dir exists] ***********************************
        fatal: [localhost]: FAILED! => {"changed": false, "module_stderr": "sudo: a password is required\n", "module_stdout": "", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 1}

        PLAY RECAP *********************************************************************
        localhost                  : ok=2    changed=1    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0   

        [Pipeline] }
        [Pipeline] // script
        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] }
        [Pipeline] // node
        [Pipeline] End of Pipeline
        ERROR: script returned exit code 2
        Finished: FAILURE
        ```

8. Отправить две ссылки на репозитории в ответе: с ролью и Declarative Pipeline и c плейбукой и Scripted Pipeline.

</details>  

1. роль с Declarative Pipeline

    https://github.com/JustAleksy/clickhouse.git

2. плейбук со Scripted Pipeline

    https://github.com/JustAleksy/example-playbook.git
