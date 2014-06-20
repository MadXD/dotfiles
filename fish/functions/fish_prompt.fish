function fish_prompt
   # Empty line
   echo

   set_color $fish_color_user
   printf '%s' (whoami)
   set_color normal
   printf ' at '

   set_color $fish_color_host
   printf '%s' (hostname | cut -d . -f 1)
   set_color normal
   printf ' in '

   set_color $fish_color_cwd
   printf '%s' (prompt_pwd)
   set_color normal

   if test (__fish_git_prompt)
      set_color yellow
      __fish_git_prompt " git:%s"
      set_color normal
   end

   if test $VIRTUAL_ENV
       printf " venv:%s" (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
   end

   # Line 2
   echo
   printf '↪  '
   set_color normal
end
