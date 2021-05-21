export const headers = new Headers(
    { 'X-CSRFToken': document.getElementsByName('csrfmiddlewaretoken')[0].value }
)
