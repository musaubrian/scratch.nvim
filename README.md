# scratch.nvim

Create temporary buffers and run the contents.

Decided to build this from this [question](https://vi.stackexchange.com/questions/11310/what-is-a-scratch-window)

Since most interprated languages can be run using `:w !interpreter` without saving the contents of the buffer as far as I know



### Features

- [x] Create a new scratch buffer
- [x] Close the buffer
- [x] Evaluate the contents of the scratch buffer
- [x] Syntax highlighting based on filetype
- [ ] LSP intergration?


## Installation

#### Packer

```lua
use {
    'musaubrian/scratch.nvim',
    requires = {
        'rcarriga/nvim-notify',
        -- If you already use *nvim-notify* You can remove this
        config = function()
            require('notify').setup({
              --You can remove this if you wish to use default icons
              icons = {
                DEBUG = 'DEBUG',
                ERROR = 'ERROR',
                INFO = 'INFO',
                TRACE = 'TRACE',
                WARN = 'WARN'
              },
              stages = 'static',
              timeout = 2000,
            })
        end }
    }
}
```


#### Lazy

```lua
{
    'musaubrian/scratch.nvim',
    dependencies = {
        {
            'rcarriga/nvim-notify',
            -- If you already use *nvim-notify* You can remove this
            opts = {
                --You can remove this if you wish to use default icons
              icons = {
                DEBUG = 'DEBUG',
                ERROR = 'ERROR',
                INFO = 'INFO',
                TRACE = 'TRACE',
                WARN = 'WARN'
              },
              stages = 'static',
              timeout = 2000,
            },
        }
    }
}

```

### Configuration
**NO** configuration needed for scratch.nvim, only for [notify]('https://github.com/rcarriga/nvim-notify');
only for the icons, notification timeout duration and the animation



## Usage

> ![NOTE]
> 
> You need to have this interprators installed on your machine
> 
> **TypeScript** uses `ts-node` from `npx`, If you've never used it run `npx ts-node` to set it up

1. Enter scratch buffer
```sh
:Scratch <file_extension>

# examples
:Scratch js
:Scratch py
```

2. evaluate contents

```sh
# while in the _scratch window

:RScratch
```



## Supported Filetypes

language   | interprator
---        | ---
python     | python / python3
lua        | lua
javascript | node
typescript | ts-node (uses `npx ts-node`)
ruby       | ruby
php        | php
shell      | bash
