{lib, ...}: {
  vim.autocmds = [
    {
      # open dashboard if nvim is called with a directory
      event = ["VimEnter"];
      callback = lib.generators.mkLuaInline ''
              function()
               local argv = vim.fn.argv(0)

         -- if opened with a directory
         if argv ~= "" and vim.fn.isdirectory(argv) == 1 then
           -- clear the directory buffer
           vim.cmd("bd")

           -- open dashboard
           require("alpha").start()
         end
        end
      '';
    }
  ];
}
