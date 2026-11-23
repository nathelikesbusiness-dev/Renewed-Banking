<script lang="ts">
    import AccountsList from "./Accounts/AccountsList.svelte";
    import AccountTransactionsList from "./Accounts/AccountTransactionsList.svelte";
    import { accounts } from '../store/stores';
    import { formatMoney } from "../utils/misc";
</script>

<div class="main">
    <div class="ambient ambient-one"></div>
    <div class="ambient ambient-two"></div>
    <header class="topbar">
        <div class="brand"><span class="brand-mark"><i class="fa-solid fa-wave-square"></i></span><div><strong>RENEWED</strong><small>PRIVATE BANKING / SECURE NODE</small></div></div>
        <div class="status"><span class="status-dot"></span> SYSTEM ONLINE <span class="divider"></span><i class="fa-solid fa-lock"></i> ENCRYPTED SESSION</div>
    </header>
    <section class="workspace"><AccountsList /><AccountTransactionsList /></section>
    <footer class="footerbar"><span><i class="fa-solid fa-wallet"></i> {$translations?.available_funds || "Available funds"}</span><strong>{formatMoney($accounts[0]?.cash || 0)}</strong><span class="footer-hint">ESC <em>close terminal</em></span></footer>
</div>

<style>
    .main { overflow: hidden; width: min(94vw, 1500px); height: min(90vh, 940px); top: 5%; left: 3%; padding: 2.1rem 2.4rem 1.4rem; position: absolute; background: linear-gradient(135deg, rgba(7,17,21,.98), rgba(10,26,32,.96)); border-radius: 1.5rem; border: 1px solid rgba(103,245,255,.2); box-shadow: 0 2rem 8rem rgba(0,0,0,.6), inset 0 1px rgba(255,255,255,.06); animation: terminal-in 500ms cubic-bezier(.2,.8,.2,1) both; }
    .main::after { content: ""; position: absolute; inset: 0; pointer-events: none; opacity: .08; background: repeating-linear-gradient(0deg, transparent 0 4px, rgba(103,245,255,.2) 5px); }
    .ambient { position: absolute; width: 28rem; height: 28rem; border-radius: 50%; filter: blur(70px); opacity: .12; pointer-events: none; }
    .ambient-one { background: var(--clr-cyan); top: -18rem; right: 10%; }
    .ambient-two { background: var(--clr-teal); bottom: -22rem; left: 20%; }
    .topbar, .footerbar, .workspace { position: relative; z-index: 1; }
    .topbar { display: flex; align-items: center; justify-content: space-between; padding-bottom: 1.8rem; border-bottom: 1px solid var(--clr-line); }
    .brand { display: flex; align-items: center; gap: .9rem; }
    .brand-mark { width: 3.3rem; height: 3.3rem; display: grid; place-items: center; color: #031c20; background: var(--clr-cyan); border-radius: .9rem; box-shadow: 0 0 24px rgba(103,245,255,.35); }
    .brand strong { display: block; font: 700 1.35rem "Sora", sans-serif; letter-spacing: .14em; }
    .brand small { display: block; color: var(--clr-muted); font-size: .62rem; letter-spacing: .17em; margin-top: .35rem; }
    .status { color: var(--clr-muted); font-size: .72rem; letter-spacing: .1em; }
    .status-dot { display: inline-block; width: .5rem; height: .5rem; margin-right: .45rem; border-radius: 50%; background: var(--clr-teal); box-shadow: 0 0 12px var(--clr-teal); }
    .status i { color: var(--clr-cyan); margin-right: .4rem; }
    .divider { display: inline-block; height: 1rem; margin: 0 1rem; border-left: 1px solid var(--clr-line); vertical-align: middle; }
    .workspace { display: flex; gap: 2rem; height: calc(100% - 10rem); padding-top: 1.8rem; }
    .footerbar { display: flex; align-items: center; gap: .7rem; height: 3.8rem; padding-top: 1rem; border-top: 1px solid var(--clr-line); color: var(--clr-muted); font-size: .82rem; }
    .footerbar i, .footerbar strong { color: var(--clr-cyan); }
    .footerbar strong { font-size: 1.1rem; }
    .footer-hint { margin-left: auto; color: var(--clr-cyan); font-weight: 800; letter-spacing: .1em; }
    .footer-hint em { color: var(--clr-muted); font-style: normal; font-weight: 400; margin-left: .35rem; letter-spacing: 0; }
    @keyframes terminal-in { from { opacity: 0; transform: translateY(1rem) scale(.985); } to { opacity: 1; transform: translateY(0) scale(1); } }
    @media (max-width: 850px) { .main { width: 94vw; left: 3%; padding: 1.4rem; } .workspace { gap: 1rem; } .status { display: none; } }
</style>
