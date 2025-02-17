# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/code/mad2/"

# Create session with specified name if it does not already exist.
if initialize_session "mad1"; then
  # Create windows with specific names
  #split_h 50 # Split horizontally

  # First window/pane setup
  new_window "editor"
  run_cmd "cd ~/code/mad2/"
  run_cmd "vim ."

  # Second window/pane setup
  new_window "zsh"

  # Third window setup

  # Select the editor window to start
  select_window editor
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
