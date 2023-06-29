# scratch.nvim

Create temporary buffers.

Decided to try and build this from this [question](https://vi.stackexchange.com/questions/11310/what-is-a-scratch-window)

> **Warning**
> 
> It is by now means stable but its usable

You can:
- Create a new scratch buffer
- Destroy a scratch buffer when you're done
- Evaluate the contents of the scratch buffer

<details>
<Summary>Currently supports evalutation of:</Summary>

  <details>
  <Summary>Python</Summary>

  ```bash
  :w !python
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
</details>

> There could be more, but these are the ones I usually use

### Installation
Use your favourite plugin manager

### Usage
```bash
:Scratch - create a new scratch buffer

:q to exit the scratch buffer
```
