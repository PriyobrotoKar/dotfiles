# Dotfiles

This repository contains my personal configuration files (dotfiles) for setting up a customized and efficient development environment. It includes configurations for tools such as Neovim, Tmux, Zsh, and Zed.

## Included Configurations

- **Neovim**: Custom settings and plugins for enhanced code editing.
- **Tmux**: Session and window management configurations for terminal multiplexing.
- **Zsh**: Shell configurations, including aliases and theme settings.
- **Zed**: Configuration files for the Zed editor.

## Installation

Follow these steps to set up the configurations on your system:

### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/PriyobrotoKar/dotfiles.git
cd dotfiles
```

### 2. Run the Installation Script

An installation script is included to create symbolic links for the configuration files in their respective locations.

Run the script:

```bash
./install/bootstrap.sh
```

If the script doesn't have execute permissions, enable them with:

```bash
chmod +x install
```

## Contributing

Contributions are welcome! If you have ideas to improve the setup:

- Fork the repository.
- Create a feature branch (git checkout -b feature-name).
- Make your changes.
- Submit a pull request.
