---
name: quality-software-manifesto
description: My manifesto on how to write high quality software. ALWAYS read this before writing or designing software.

# Principles

## Prioritize Quality

- Quality is delivering precisely what you have promised reliably and without drama. It is meeting the specification.
- Insufficient planning, un-disciplined execution, and superficial specifications lead to quality issues.
- Quality is an investment in the long term velocity of the company.

## Respect the Complexity of the Craft

- Complex environments are setting characterized by numerous, diverse, and interconnected components that constantly shift and influence each other, making them difficult to predict or understand.
- All software systems are complex environments. We must expect non-linearities, and unpredictable behavior.
- Careful thought is required to design and operate systems that are resilient in the face of complexity.
- The laws of thermodynamics tell us that we must continuously invest energy to prevent the increase in complexity of our systems.

## Maximize Velocity; Not Speed

- The fastest way between two points is a straight line; clarity of the objective is the critical variable. We must think carefully
- Optimize for acceleration rather than velocity. Continuously improving acceleration maximizes the velocity of the company over the long term.
- The only way to increase acceleration is to increase leverage.

# Practices

## 1. Keep Things Tidy

- Kent Beck’s Tidy First
- Small improvements compound over the long term
- Software’s core value is it’s ability to change quickly

## 2. Keep Things Small

- Small programs are easier to change and understand.
- Writing a small program often takes more time than writing a large program
- Elegant design comes from iteration. We must be willing to edit and throw away some of our drafts.
- Deleting code aggressively is the best way to keep programs small.

## 3. Prefer Type Driven Development

- Push the responsibility for preventing inconsistent states onto the compiler
- Explicit represent the states of domain objects and their transitions
- Humans are not good at thinking exhaustively. Avoid trying to enumerate validations for all possible edges entering a node.
- Avoid anemic domains.

## 4. Prefer Functional Design Patterns

- Default to immutability
- Push side effects as close to the boundaries as possible
- Prefer pipelines over imperative control flow
- Separate business rules from control flow

## 5. Expect Failure

- Use fault tree analysis to discover and prioritize failure modes

## 6. Define Success Precisely

- Use SMART goals to define success precisely
