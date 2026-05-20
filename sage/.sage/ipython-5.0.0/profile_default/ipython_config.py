# Initialize the configuration object
c = get_config()

# Enable vi keybindings
c.TerminalInteractiveShell.editing_mode = 'vi'

# Optional but recommended: Removes the delay when pressing ESC
c.TerminalInteractiveShell.emacs_bindings_in_vi_insert_mode = False

# Editor integration
c.TerminalInteractiveShell.editor = 'nvim'
