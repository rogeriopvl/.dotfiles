# this script remaps the key § on macbooks to be backtick/tilde
# it works for the current session, but loses effect after restart, so it needs
# to be added to Login items & Extensions via automator to run on every boot.
hidutil property \
  --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc": 0x700000064,"HIDKeyboardModifierMappingDst":0x700000035}]}'
