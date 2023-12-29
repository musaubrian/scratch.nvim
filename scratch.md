# Scratch.nvim

Create temporary buffers and run the contents.

## Commands

### Scratch
Opens up the scratch buffer.
Requires the file extension as an argument for syntax highlighting

#### usage:
`:Scratch <file_extension>`

#### examples

```sh
:Scratch js
:Scratch py
```

### RScratch
Evaluates the contents of the scratch buffer (Runs your program)

#### usage:
`:RScratch`


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
