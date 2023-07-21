# scratch.nvim

Create temporary buffers.

Decided to try and build this from this [question](https://vi.stackexchange.com/questions/11310/what-is-a-scratch-window)

You can:
- Create a new scratch buffer
- Close the buffer
- Evaluate the contents of the scratch buffer

Currently supports evalutation of:
- Python
- TypeScript && JavaScript

<br/>

> Most interprated languages can be run this way without saving the contents of the buffer
>
> ```bash
> :w !interpreter
> ```

### Installation
Use your favourite plugin manager


### Usage

> Enter the interpreter when prompted.
>
>
> If **TypeScript** input `ts`

```bash
:Scratch - create a new scratch buffer
:RScratch - evaluate the contents of the buffer
:q to exit the scratch buffer
```

For more information run: `:help scratch`
