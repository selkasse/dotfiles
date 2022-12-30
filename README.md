# dotfiles

This is meant to get your dev environment up and running from a fresh Ubuntu install on WSL2.

# Install GitHub CLI

<details>
  <summary>GitHub CLI</summary>
  
  ```
  sudo apt install gh
  gh auth login
  ```
 
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
  
  ```
  sudo apt install trash-cli
  ```
  
  Note that there are several aliases for this tool in the `.zshrc` file
</details>


# Install ZSH/oh-my-zsh

<details>
  <summary>ZSH</summary>
 
  ```
  sudo apt install zsh
  
  # verify installation
  zsh --version

  # set as default shell
  chsh -s $(which zsh)
  ```
  
  - Exit terminal
  - Re-open terminal
  - You are then prompted with a list of options regarding `.zshrc` file
    - Select option `(0)`
  

</details>

<details>
  <summary>oh-my-zsh</summary>
  Note that `zsh` must be installed prior to installing `oh-my-zsh`
  
  ```
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```

  - Then copy the contents of the `.zshrc` in this repo into `~/.zshrc`
</details>

<details>
  <summary>zsh-autosuggestions</summary>
  
  ```
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  ```
</details>

<details>
  <summary>zsh-syntax-highlighting</summary>
  
  ```
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
  echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
  ```
</details>
