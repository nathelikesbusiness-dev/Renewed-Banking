<section class="loading-container">
    <section class="loading-content">
        <div class="loading-orbit"></div><div class="loading-copy"><span>SECURE CHANNEL</span><strong>SYNCING ACCOUNTS</strong><small>Verifying encrypted ledger data</small></div>
        <div class="loading-spinner">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </section>
</section>

<style>
    .loading-container { position: fixed; inset: 0; z-index: 10; display: flex; align-items: center; justify-content: center; background: rgba(1,8,10,.86); }
    .loading-content { position: relative; width: 28rem; height: 20rem; display: flex; align-items: center; justify-content: center; overflow: hidden; background: linear-gradient(145deg, #10272e, #071317); border: 1px solid rgba(103,245,255,.25); border-radius: 1.2rem; box-shadow: 0 2rem 6rem rgba(0,0,0,.6); }
    .loading-orbit { position: absolute; width: 13rem; height: 13rem; border: 1px solid rgba(103,245,255,.22); border-radius: 50%; animation: orbit 4s linear infinite; }
    .loading-copy { position: absolute; bottom: 2rem; text-align: center; }
    .loading-copy span, .loading-copy small { display: block; color: var(--clr-muted); font-size: .6rem; letter-spacing: .15em; }
    .loading-copy strong { display: block; margin: .4rem 0; color: var(--clr-cyan); font: 600 .9rem "Sora", sans-serif; letter-spacing: .08em; }

    .loading-spinner { color: var(--clr-cyan); display: inline-block; position: relative; width: 80px; height: 80px; }
    .loading-spinner div {
        transform-origin: 40px 40px;
        animation: loading-spinner 1.2s linear infinite;
    }
    .loading-spinner div:after {
        content: " ";
        display: block;
        position: absolute;
        top: 3px;
        left: 37px;
        width: 6px;
        height: 18px;
        border-radius: 20%;
        background: #fff;
    }
    .loading-spinner div:nth-child(1) {
        transform: rotate(0deg);
        animation-delay: -1.1s;
    }
    .loading-spinner div:nth-child(2) {
        transform: rotate(30deg);
        animation-delay: -1s;
    }
    .loading-spinner div:nth-child(3) {
        transform: rotate(60deg);
        animation-delay: -0.9s;
    }
    .loading-spinner div:nth-child(4) {
        transform: rotate(90deg);
        animation-delay: -0.8s;
    }
    .loading-spinner div:nth-child(5) {
        transform: rotate(120deg);
        animation-delay: -0.7s;
    }
    .loading-spinner div:nth-child(6) {
        transform: rotate(150deg);
        animation-delay: -0.6s;
    }
    .loading-spinner div:nth-child(7) {
        transform: rotate(180deg);
        animation-delay: -0.5s;
    }
    .loading-spinner div:nth-child(8) {
        transform: rotate(210deg);
        animation-delay: -0.4s;
    }
    .loading-spinner div:nth-child(9) {
        transform: rotate(240deg);
        animation-delay: -0.3s;
    }
    .loading-spinner div:nth-child(10) {
        transform: rotate(270deg);
        animation-delay: -0.2s;
    }
    .loading-spinner div:nth-child(11) {
        transform: rotate(300deg);
        animation-delay: -0.1s;
    }
    .loading-spinner div:nth-child(12) {
        transform: rotate(330deg);
        animation-delay: 0s;
    }
    @keyframes loading-spinner { 0% { opacity: 1; } 100% { opacity: 0; } }
    @keyframes orbit { to { transform: rotate(360deg); } }

</style>
