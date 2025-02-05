from .array import Array
from .object import Object
from .value import Value, Null
from .utils import write, write_pretty
from .parser import Parser, ParseOptions

alias JSON = Value

@always_inline
fn parse[options: ParseOptions = ParseOptions()](out j: JSON, s: String) raises:
    """Parses a JSON object from a String.

    Parameters:
        options: The parsing options to be applied.

    Args:
        s: The input String.

    Returns:
        A JSON object.
    
    Raises:
        If an invalid JSON string is provided.
    """
    var p = Parser[options](s)
    j = p.parse()


@always_inline
fn to_string[*, pretty: Bool = False](out s: String, j: JSON):
    """Stringifies the given JSON object.

    Parameters:
        pretty: Pretty prints the object is True, else uses condensed representation.
    
    Args:
        j: The input JSON object to be stringified.
    
    Returns:
        The String representation of the JSON object.
    """
    @parameter
    if pretty:
        s = write_pretty(j)
    else:
        s = write(j)
