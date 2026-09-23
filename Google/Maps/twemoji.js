function countryCode_twemoji(code) {
    const arr = [];
    for (let i = 0; i < code.length; i++) {
        arr.push(
            (code.charCodeAt(i) - 0x41 + 0x1F1E6).toString(16)
        );
    }

    return 'https://twemoji.maxcdn.com/v/latest/72x72/' +
        arr.join('-') +
        '.png';
}
