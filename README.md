# scratch.nvim

Create temporary buffers and run the contents.

Decided to build this from this [question](https://vi.stackexchange.com/questions/11310/what-is-a-scratch-window)

Most interprated languages can be run using `:w !interpretor` without saving the contents of the buffer as far as I know.

So I built this to do it for me



### Features

- [x] Create a new scratch buffer
- [x] Close the buffer
- [x] Evaluate the contents of the scratch buffer
- [x] Syntax highlighting based on filetype
- [ ] LSP intergration?


## Installation

#### Packer

```lua

use 'musaubrian/scratch.nvim',
```


#### Lazy

```lua

'musaubrian/scratch.nvim',
```



> [!NOTE]
> 
> You need to have this interprators installed on your machine
> 
> **TypeScript** uses `ts-node`, If you've never used it run `npx ts-node` to set it up


For more help info, run `:help scratch-nvim`
