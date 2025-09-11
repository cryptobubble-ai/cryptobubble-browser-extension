<script>
    import Header from "./lib/components/layout/Header.svelte";
    import Card from "./lib/components/card/Card.svelte";
    import Footer from "./lib/components/layout/Footer.svelte";
    const API_URL =
        (window.CB_CONFIG && window.CB_CONFIG.apiUrl) ||
        "https://api.cryptobubble.ai/v1/consensus/latest?lang=en";
    let data = null;
    let error = "";

    load();

    async function load() {
        try {
            error = "";
            const r = await fetch(API_URL, {
                cache: "no-cache",
                headers: { "X-Client-Source": "chrome-extension" }
            });
            if (!r.ok) throw new Error("API " + r.status);
            data = await r.json();
        } catch (e) {
            error = String(e);
        }
    }
</script>

<div class="app">
    <div class="header">
        <Header />
    </div>

    {#if error}
        <div class="error">Error: {error}</div>
    {/if}

    <div class="card">
        <Card {data} />
    </div>

   <div class="footer">
        <Footer />
    </div>
</div>

<style>
    :global(html),
    :global(body) {
        font-family:
            ui-sans-serif,
            system-ui,
            -apple-system,
            Segoe UI,
            Roboto,
            Helvetica,
            Arial,
            "Apple Color Emoji",
            "Segoe UI Emoji",
            "Segoe UI Symbol";
    }
    
    .app {
        width: 360px;
        padding: 1rem;
    }

    .error {
        padding: 2rem;
        color: #ffd166;
    }

    .card {
        margin-top: 1rem;
    }    

    .footer {
        margin-top: 1rem;
        margin-left: 0.75rem;
        margin-right: 0.75rem;
    }
</style>
