# scratch.nvim

Create temporary buffers.

Decided to try and build this from this [question](https://vi.stackexchange.com/questions/11310/what-is-a-scratch-window)

> **Warning**
> 
> It is by no means stable but its usable

You can:
- Create a new scratch buffer
- Close the buffer
- Evaluate the contents of the scratch buffer

Currently supports evalutation of:
  <details>
  <Summary>Python</Summary>

  ```bash
  :w !python
  # or
  :w !python3
  ```
  </details>
  <details>
  <Summary>JavaScript</Summary>

  ```bash
  :w !node
  ```
  </details>

  <details>
  <Summary>TypeScript</Summary>

  ```bash
  :w !npx ts-node
  ```
  </details>

<br/>

  Most interprated languages can be run this way
  ```bash
  :w !interprator
  ```

### Installation
Use your favourite plugin manager

### Usage
```bash
:Scratch - create a new scratch buffer

:q to exit the scratch buffer
```


For more information run: `:help scratch`
