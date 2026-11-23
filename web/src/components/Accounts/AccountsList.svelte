<script lang="ts">
    import { accounts, translations } from "../../store/stores";
    import AccountListItem from "./AccountListItem.svelte";
    let accSearch = "";
</script>

<aside>
    <div class="section-label"><span class="eyebrow">01 / PORTFOLIO</span><h3 class="heading">{$translations.accounts}</h3><span class="count">{$accounts.length} ACTIVE</span></div>
    <div class="search-wrap"><i class="fa-solid fa-magnifying-glass"></i><input type="text" class="acc-search" placeholder={$translations.account_search} bind:value={accSearch} /></div>
    <section class="scroller">
        {#if $accounts.filter(item => item.name.toLowerCase().includes(accSearch.toLowerCase())).length > 0}
            {#each $accounts.filter(item => item.name.toLowerCase().includes(accSearch.toLowerCase())) as account (account.id)}
                <AccountListItem {account} />
            {/each}
        {:else}
            <h3 style="text-align: left; color: #F3F4F5; margin-top: 1rem;">{$translations.account_not_found}</h3>
        {/if}
    </section>
</aside>

<style>
    aside { flex: 0 0 31%; padding: 0 .4rem; min-width: 250px; }
    .section-label { position: relative; }
    .eyebrow { color: var(--clr-cyan); font-size: .67rem; letter-spacing: .16em; }
    .heading { margin: .55rem 0 1rem; font: 700 1.65rem "Sora", sans-serif; text-transform: none; letter-spacing: -.03em; }
    .count { position: absolute; right: 0; bottom: 1.4rem; color: var(--clr-muted); font-size: .62rem; letter-spacing: .1em; }
    .search-wrap { display: flex; align-items: center; gap: .7rem; padding: 0 1rem; margin-bottom: 1rem; background: rgba(255,255,255,.045); border: 1px solid rgba(255,255,255,.08); border-radius: .7rem; color: var(--clr-muted); }
    .acc-search { width: 100%; border: 0; outline: 0; padding: 1rem 0; background: transparent; color: var(--clr-white); }
    .acc-search::placeholder { color: #547079; }
</style>
