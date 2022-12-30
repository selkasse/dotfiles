# dotfiles

This is meant to get your dev environment up and running from a fresh Ubuntu install on WSL2.

# Install GitHub CLI

<details>
  <summary>GitHub CLI</summary>
  
  ```
  sudo apt install gh
  gh auth login
  ```
  `sudo apt install gh`
  
  `gh auth login`
  - select 'GitHub.com'
  - select HTTPS
  - Yes to authenticate with GitHub credentials
  - Log in with a web browser
</details>


# Install `trash-cli`

<details>
  <summary>trash-cli</summary>
  
  Main reason for this tool is that WSL does not have a recycle bin.
  
  `trash-cli` provides a safer way to delete files and folders, allowing them to be recovered.
  
  `sudo apt install trash-cli`
  
  Note that there are several aliases for this tool in the `.zshrc` file
</details>
