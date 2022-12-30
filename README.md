# dotfiles

This is meant to get your dev environment up and running from a fresh Ubuntu install on WSL2.

# Install NeoVim Latest

<details>
  <summary>NeoVim Latest</summary>
  
  ```
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt-get update
  sudo apt-get install neovim
  ```
  - Check that the latest version was installed

```
nvim --version
```

</details>

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
  ```

verify installation

```
zsh --version
```

set as default shell

```
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

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

```

</details>

# Windows Terminal Customization

<details>
<summary>Windows Terminal Customization</summary>

- Themes available on [this site](https://windowsterminalthemes.dev/)
- Press 'Get theme' to copy the CSS to your clipboard
- In Windows Terminal, open Settings
- From Settings, press "Open JSON file" in the lower-left
- in the JSON file, scroll to the bottom and find the `schemes` section
- add a comma to the JSON in the last scheme, paste in the scheme from the website

Now, the theme needs to be set in the Windows Terminal app:

- Click your profile in the side panel of the 'Settings' menu
- Scroll to the bottom and select **Appearance** under _Additional Settings_
- The theme you just added should now appear in the **Color scheme** dropdown
- Select the theme you want, press **Save**, then view the theme back in the terminal tab

</details>

# Install Node.js

<details>
<summary>Node.js</summary>

- Check which version of Node is currently the LTS
  - https://nodejs.org/en/
- Run the commands below, replacing `18` with the major version of the current LTS

```
cd ~
curl -sL https://deb.nodesource.com/setup_18.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
sudo apt install nodejs
```

Need to change node's default directory to avoid permission issues with global installs:

```
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
```

Then, add the following to the end of your `.zshrc`:

```
PATH=~/.npm-global/bin:$PATH
```

  </details>

# SFDX Setup

Make sure you install Node.js and complete the default directory change instructions before installing

```
npm install sfdx-cli --global
npm install @salesforce/cli --global
```

- Salesforce CLI
- Java Installation
- setting Path Within VS Code

# Integrating NeoVim with VS Code

- WSL checkbox
- nvim path
- config path (init.lua)

# Resources

- Primeagen's "Vim as Your Editor" series
- Primeagen's "0 to LSP" video
- TJ Devries' "Instant IDE"
- TJ Devries' "Builtin Setup Guide"
- Chris@Machine's Video
- Firenvim "turn your browser into a Neovim client"
- Apex Language Server link
