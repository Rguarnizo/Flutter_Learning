# easy_route_transitions

This Package helps to transitions page to page.

## Example

```
RouteTransitions(
    context: context,
    child: PageToNavigate(),
    animation: AnimationType.fadeIn,
    duration: Duration(milliseconds: 100),
    replacement: true,
)
```