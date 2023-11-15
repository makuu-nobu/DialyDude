document.addEventListener('DOMContentLoaded', () => {
    const signOutButton = document.getElementById('sign-out-button'); // ログアウトボタンのIDを指定

    if (signOutButton) {
        signOutButton.addEventListener('click', () => {
        // ログアウト時にページをリロード
        window.location.reload();
        });
    }
});