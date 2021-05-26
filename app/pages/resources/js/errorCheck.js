window.addEventListener("load", function() {
    const urlParams = new URLSearchParams(window.location.search);
    const error = urlParams.get('error');
    if (error) {
        switch (error) {
            case "invalid_token":
            case "state_mismatch":
                alert("Invalid spotify login. Retry")
                window.location.href = window.Location.href.replace('/app', '/spotify');
                break;
            default:
                alert("error on page. Please try again later")
        }
    }
});