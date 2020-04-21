#!/bin/bash

# Check if homebrew is installed
if ! (command -v brew >/dev/null 2>&1); then
    echo "Homebrew missing, installing"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing firacode v2 font"
brew tap homebrew/cask-fonts
brew cask install font-fira-code

echo "Installing fish"
brew install fish

echo "Installing shellcheck"
brew install shellcheck


echo "Setting up VS Code"
# Make symlink so you can run code
ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" /usr/local/bin/code || true

brew install tflint terraform

code --install-extension aaron-bond.better-comments
code --install-extension akamud.vscode-theme-onedark
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension cssho.vscode-svgviewer
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension dbaeumer.vscode-eslint
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension eamodio.gitlens
code --install-extension eg2.vscode-npm-script
code --install-extension Equinusocio.vsc-community-material-theme
code --install-extension Equinusocio.vsc-material-theme
code --install-extension equinusocio.vsc-material-theme-icons
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension joelday.docthis
code --install-extension leizongmin.node-module-intellisense
code --install-extension mauve.terraform
code --install-extension mikestead.dotenv
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.Go
code --install-extension oderwat.indent-rainbow
code --install-extension PKief.material-icon-theme
code --install-extension run-at-scale.terraform-doc-snippets
code --install-extension seansassenrath.vscode-theme-superonedark
code --install-extension spywhere.guides
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension timonwong.shellcheck
code --install-extension wix.vscode-import-cost
code --install-extension zhuangtongfa.material-theme

echo "Copying VS Code Settings"
mv ~/Library/Application\ Support/Code/User/settings.json ~/Library/Application\ Support/Code/User/settings.json.bak || true
cp "vscode/settings.json" ~/Library/Application\ Support/Code/User/settings.json

# Fix TF linter
cd /Users/ilan/.vscode/extensions/mauve.terraform-1.4.0/lspbin && terraform init

echo "Installing OMF and bobthefish"
curl -L https://get.oh-my.fish | fish
omf install bobthefish
mv ~/.config/fish/config.fish ~/.config/fish/config.fish.bak || true
cp fish/config.fish ~/.config/fish/config.fish

echo "Installing Python3"
brew install python3

echo "Installing gcloud"
curl https://sdk.cloud.google.com > install.sh
bash install.sh --disable-prompts
rm install.sh
echo "source '$HOME/google-cloud-sdk/path.fish.inc'" >> $HOME/.config/fish/config.fish

echo "Installing gcloud completions for fish
omf install git@github.com:aliz-ai/google-cloud-sdk-fish-completion.git  

echo "Done"
echo
echo "Open iTerm2 and import this profile - ./iterm2/profile.json"
echo "Please restart vscode and terminal window after"
