# Mars Explorer

## Using the command line

```bash
  ruby mars_explore_cli.rb <file_with_instructions.txt>
```

## Setup

Just run the setup script to configure the app:

```bash
  bin/setup
```

## Configuration

We're using environment variables for configuration and we're using .dotenv to
manage that in development.

When you run `bin/setup` a copy of `.env.example` will be created with the name
`.env`. In this file, you can set your custom configuration values.