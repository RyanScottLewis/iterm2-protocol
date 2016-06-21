require "pathname"

$ROOT_PATH = Pathname.new(__FILE__).join("..", "..").expand_path
$SPEC_PATH = $ROOT_PATH.join("spec")
$FIXTURE_PATH = $SPEC_PATH.join("fixtures")
$LIB_PATH = $ROOT_PATH.join("lib")

$LOAD_PATH.unshift($LIB_PATH.to_s)

require "iterm2/protocol"

helpers_path_query = $SPEC_PATH.join("helpers", "**", "*.rb")
Dir[helpers_path_query.to_s].each { |path| require(path) }
