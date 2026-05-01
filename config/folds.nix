{pkgs, ...}: {
  plugins.nvim-ufo = {
    enable = true;
    settings = {
      provider_selector = ''
        function(bufnr, filetype, buftype)
         			return { 'lsp', 'indent' }
         		end
      '';
    };
  };
  extraConfigLua =
    /*
    lua
    */
    ''
      -- Configuration for UFO folds
      vim.keymap.set('n', 'zK', function()
      	local winid = require('ufo').peekFoldedLinesUnderCursor()
      	if not winid then
      		vim.lsp.buf.hover()
      	end
      end, { desc = "Pee[k] fold" })
    '';
}
