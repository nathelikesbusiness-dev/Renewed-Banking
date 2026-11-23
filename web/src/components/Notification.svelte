<script>
    import { notify } from "../store/stores";
</script>

<section class="notificaion-container"><section class="notificaion-content"><span class="notice-icon"><i class="fa-solid fa-bell"></i></span><div><small>SECURITY NOTICE</small><strong>{$notify}</strong></div></section></section>

<style>
    .notificaion-container { width: min(24rem, 90vw); position: absolute; z-index: 8; right: 4%; top: 4%; animation: notice-in 300ms ease both; }
    .notificaion-content { display: flex; align-items: center; gap: .8rem; padding: 1rem; border: 1px solid rgba(103,245,255,.3); border-radius: .9rem; background: rgba(9,25,30,.96); box-shadow: 0 1rem 3rem rgba(0,0,0,.35); }
    .notice-icon { display: grid; place-items: center; width: 2.2rem; height: 2.2rem; border-radius: .6rem; color: #06282c; background: var(--clr-cyan); }
    .notificaion-content small, .notificaion-content strong { display: block; }
    .notificaion-content small { color: var(--clr-cyan); font-size: .58rem; letter-spacing: .13em; }
    .notificaion-content strong { margin-top: .25rem; font-size: .78rem; }
    @keyframes notice-in { from { opacity: 0; transform: translateY(-.5rem); } to { opacity: 1; transform: translateY(0); } }
</style>
