#!/usr/bin/env python
import click
from predlib import predict


@click.command()
@click.option(
    "--weight",
    prompt="MLB Player Weight",
    help="Pass in the weight of a MLB player to predict the height",
)
def predictcli(weight):
    """Predicts Height of an MLB player based on weight"""

    result = predict(weight)
    inches = result["height_inches"]
    human_readable = result["height_human_readable"]
    if int(inches) > 72:
        click.echo(click.style(human_readable, bg="black", fg="white"))
    else:
        click.echo(click.style(human_readable, bg="blue", fg="white"))


if __name__ == "__main__":
    predictcli()
