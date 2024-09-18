# Contributing Guidelines

Thank you so much for wanting to contribute to this repo! Here are a few important things you should know about contributing:

  1. Changes require discussion, use cases, etc. Code comes later.
  2. Pull requests are great for small fixes for bugs, documentation, etc.
  3. Code contributions require updating relevant documentation.

This project takes all contributions through <a href='https://help.github.com/articles/using-pull-requests'>pull requests</a>.
Code should *not* be pushed directly to `master`.

The following guidelines apply to all contributors.

## General Guidelines
<ul>
  <li>Prefer only one logical change per commit</li>
  <li>Prefer not mixing whitespace changes with functional code changes</li>
  <li>Prefer not mixing unrelated functional changes</li>
  <li>When writing a commit message:
    <ul>
    <li>Describe _why_ a change is being made</li>
    <li>Do not assume the reviewer understands what the original problem was</li>
    <li>Do not assume the code is self-evident/self-documenting</li>
    <li>Describe any limitations of the current code</li>
    </ul>
  </li>
  <li>Any significant changes should be accompanied by tests.</li>
  <li>The project already has good test coverage, so look at some of the existing tests if you're unsure how to go about it.</li>
</ul>

## Commit Message Guidelines
* Provide a brief description of the change in the first line.
* Insert a single blank line after the first line
* Provide a detailed description of the change in the following lines, breaking
 paragraphs where needed.
* The first line should be limited to 50 characters.
* Subsequent lines should be wrapped at 72 characters.
* Put `Closes #XXX` line at the very end (where `XXX` is the actual issue number) if the proposed change is relevant to a tracked issue.

Note: In Git commits the first line of the commit message has special significance. It is used as the email subject line, in git annotate messages, in gitk viewer annotations, in merge commit messages and many more places where space is at a premium. Please make the effort to write a good first line!


## Making Changes
* Fork the repository
* Make your changes
* Run tests
* Push your changes to a branch in your fork
* See our commit message guidelines above in this document
* Submit a pull request to the repository
* Update any related GITHUB issues with the generated pull request link