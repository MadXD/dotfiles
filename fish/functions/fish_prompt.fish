function fish_prompt
   # Empty line
   echo

   set_color green
   printf '%s' (whoami)
   set_color normal
   printf ' at '

   set_color cyan
   printf '%s' (hostname | cut -d . -f 1)
   set_color normal
   printf ' in '

   set_color green
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
   printf '↪ '
   set_color normal
end
