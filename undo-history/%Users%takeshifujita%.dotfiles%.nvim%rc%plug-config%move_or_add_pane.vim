Vim?UnDo? ^??E8?Խ#$ ?*??E?Z??`e^?ڧ->      W" Window navigation - move to the window in the direction shown, or create a new window      "                       a???    _?                             ????                                                                                                                                                                                                                                                                                                                                                             a???    ?                   ?               5??                                         =      5?_?                            ????                                                                                                                                                                                                                                                                                                                               ?                  V   ?    a???    ?                @" nnoremap <Plug>(WinMoveRight) :<C-u>call <SID>WinMove('l')<CR>?                =" nnoremap <Plug>(WinMoveUp) :<C-u>call <SID>WinMove('k')<CR>?                ?" nnoremap <Plug>(WinMoveDown) :<C-u>call <SID>WinMove('j')<CR>?                ?" nnoremap <Plug>(WinMoveLeft) :<C-u>call <SID>WinMove('h')<CR>?                " endfunction?                " 	endif?                " 		exec "wincmd ".a:key?   
             	" 		endif?   	             " 			wincmd s?      
          " 		else?      	          " 			wincmd v?                " 		if (match(a:key,'[jk]'))?                " 	if (t:curwin == winnr())?                " 	exec "wincmd ".a:key?                " 	let t:curwin = winnr()?                " function s:WinMove(key)?                Y" " Window navigation - move to the window in the direction shown, or create a new window?                  5??                                                    ?               Y       W          Y       W       ?                         Y                     ?                         q                     ?                         ?                     ?                         ?                     ?                         ?                     ?                         ?                     ?                         ?                     ?    	                     ?                     ?    
           	          ?       	              ?                         ?                     ?                                             ?                                             ?               ?       =   %      ?       =       ?               ?       =   c      ?       =       ?               =       ;   ?      =       ;       ?               @       >   ?      @       >       5?_?                            ????                                                                                                                                                                                                                                                                                                                               ?                  V   ?    a???    ?                  5??                                                  5?_?                      "    ????                                                                                                                                                                                                                                                                                                                               ?                  V   ?    a???    ?                W" Window navigation - move to the window in the direction shown, or create a new window5??        "                 "                     5?_?                        O    ????                                                                                                                                                                                                                                                                                                                               ?                  V   ?    a???    ?                U" Window navigation - move to the pane in the direction shown, or create a new window5??        O                 O                     5?_?                            ????                                                                                                                                                                                                                                                                                                                               ?                  V   ?    a???    ?               5??                                   X               5???