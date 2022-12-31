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

<details>
<summary>Salesforce CLI</summary>

```
npm install sfdx-cli --global
npm install @salesforce/cli --global
```

</details>

<details>
<summary>Java installation</summary>

- Look at the [Salesforce Documentation](https://developer.salesforce.com/tools/vscode/en/vscode-desktop/java-setup) to see which version of the JDK is recommended
- Run `apt-cache java` to list available versions from the package manager
- Find the JRE package name for the recommended version
  - For example: `openjdk-17-jre`
- Prepend `sudo apt install` to the name of the package:
  - `sudo apt install openjdk-17-jre`
  - Verify installation with `java -version`
- Do the same thing with the JDK package
  - `sudo apt install openjdk-17-jdk`
  - Verify installation with `javac -version`

</details>

# SFDX VS Code Plugins

<details>
<summary>SFDX VS Code Plugins</summary>

- Salesforce CLI Integration
- Salesforce Extension Pack
- Salesforce Extension Pack (Expanded)

Once the Salesforce extensions are installed, you will receive an error about your `JAVA_HOME` environment setting. To fix the error, follow the steps below:

- get your Java installation path by running `which java`
- copy the path
- In VS Code, open your Settings and search for 'Java Home'
- in the `Salesforce-vscode-apex > Java:Home` setting, enter the Java path
- Exit and re-open VS Code

</details>

# Integrating Neovim with VS Code

<details>
<summary>Integrating Neovim with VS Code</summary>

- Install VSCode Neovim VS Code extension
- Install Lua extension
  - this will allow for syntax highlighting and typechecking when working with `.lua` files
- Find your nvim installation path with `which nvim`
- Make sure you have copied the `.config` folder of this repo to `~/.config`
- Click the gear for the Neovim extension
  - Click _Extension Settings_
- Find the setting: `Vscode-neovim > Neovim Executable Paths: Linux`
  - set its value to the nvim installation path
- Find the setting: `Vscode-neovim > Neovim Init Vim Paths`
  - set its value to `~/.config/nvim/init.lua`
- **IF USING WSL**
  - Find the setting `Vscode-neovim: Use WSL` and check the box

</details>

# Packer

<details>
<summary>Packer</summary>

Packer is the Neovim plugin manager we will be using for this configuration.

You'll notice there is a `packer.lua` file in `.config/nvim/lua/neoVimConfig`. This file will not work until we clone the [repo](https://github.com/wbthomason/packer.nvim):

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

After running the command above, follow these steps:

- open the Packer config

```
nvim .config/nvim/lua/neoVimConfig/packer.lua
```

- source the file by running `:so` within Neovim
- run `:PackerSync` to install the plugins listed in the file

</details>

# firenvim

<details>
<summary>firenvim</summary>

firenvim allows you to use your Neovim configuration within a browser's textarea.

at a high level, firenvim requires two things:

- firenvim plugin in Neovim
- firenvim browser extension

before performing the steps in the section, make sure you have followed the steps in the **Packer** section above

once Packer is installed, follow the steps below:

- open the Packer config

```
nvim .config/nvim/lua/neoVimConfig/packer.lua
```

- add the following to the list of existing plugins within the file

```
 use ({
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  })
```

- save the file
- source the file with `:so`
- install the plugin with `:PackerSync`

  - you will need to keep pressing `ENTER` at the Packer installation screen
  - the installation will eventually complete, and the small window at the bottom will disappear

- install the firenvim extension for whatever browser you are using
- close and re-open your browser
- go to a site that has a text area (such as [regexr](https://regexr.com/))
- click into the text area. Neovim should activate

</details>

<details>
<summary>creating a firenvim-specific config</summary>

if you are using the file structure outlined in this repo, some of the instructions may already be complete

- open `.config/nvim/init.lua`
- the file should look like this:

```
if vim.g.vscode then
    -- VSCode extension
    require("vsCodeConfig")
elseif vim.g.started_by_firenvim then
    -- firenvim browser extension
    require("fireNvimConfig")
else
    -- ordinary Neovim
    require("neoVimConfig")
end

```

- in the `.config/nvim/lua` folder, make a new folder called `fireNvimConfig`
- create two files:

  - `/.config/nvim/lua/fireNvimconfig/init.lua`
  - `/.config/nvim/lua/fireNvimconfig/settings.lua`

- in `fireNvimConfig/init.lua`:

```
require('fireNvimConfig.settings')

```

- then, place your firenvim-specific settings in `fireNvimconfig/settings.lua`

- Note that plugins installed from the `neoVimConfig` folder are accessible in the `fireNvimConfig` folder
  - there is no need to set up your plugin manager again in this folder

</details>

<details>
<summary>troubleshooting</summary>

To see if there are any errors when loading firenvim:

- click the Extensions button in your browser (looks like a puzzlie piece)
- click Firenvim
- click "Reload Settings"
- any errors will show up in the extension widget

If you are using Brave, you may need to take these steps to get the extension working:

- open neovim
  - `nvim .`
- open the command in neovim by pressing the colon key `:`
- paste the following after the colon:
  - `call firenvim#install(0)`
- close and re-open Brave
- attempt to invoke firenvim in a textarea once more

If you having trouble getting the nvim interface to show up, but not seeing any errors, you may need to invoke it manually.

- the default shortcut for doing this is `<C-e>`

If you are able to invoke the interface on some sites, but not others, you may need to invoke firenvim as an iframe:

- open the shortcuts menu for your browser at `chrome://extensions/shortcuts`
  - replace `chrome` with the name of your browser
- find the shortcut titled "Turn the currently focused element into a neovim iframe"
  - set a shortcut (such as `<C-i>`)
  - either reload firenvim settings, or reopen the browser entirely

</details>

# Resources

- [The Primeagen "Vim as Your Editor" playlist](https://www.youtube.com/watch?v=X6AR2RMB5tE&list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R)
- [The Primeagen "Neovim RC From Scratch"](https://www.youtube.com/watch?v=w7i4amO_zaE)
- [TJ DeVries "Instant IDE"](https://www.youtube.com/watch?v=stqUbv-5u2s)
- [TJ Devries "Builtin LSP Setup Guide"](https://www.youtube.com/watch?v=puWgHa7k3SY)
- [chris@machine VSCode with embedded Neovim](https://www.youtube.com/watch?v=g4dXZ0RQWdw)
- [Firenvim "turn your browser into a Neovim client"](https://github.com/glacambre/firenvim)
- [Apex Language Server](https://developer.salesforce.com/tools/vscode/en/apex/language-server)

```

```
