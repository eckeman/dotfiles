function __bundle_set_binstub_path --description 'Add binstub to path'
	if set -qg BUNDLE_BINSTUB_PATH
		return 1
	end

	set -l gemfile_path $argv[1]

	set -xg BUNDLE_BINSTUB_PATH (dirname $gemfile_path)/bin
	if test -d $BUNDLE_BINSTUB_PATH
		set fish_user_paths $fish_user_paths $BUNDLE_BINSTUB_PATH
	end
end
