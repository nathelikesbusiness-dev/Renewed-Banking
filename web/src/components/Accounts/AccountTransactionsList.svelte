<script lang="ts">
    import { accounts, activeAccount, translations, atm, notify} from "../../store/stores";
    import AccountTransactionItem from "./AccountTransactionItem.svelte";
    import { convertToCSV } from "../../utils/convertToCSV";
    import { setClipboard } from "../../utils/setClipboad";
    let transSearch = '';
    $: account = $accounts.find((accountItem: any) => $activeAccount === accountItem.id);

    function handleClickExportData() {
        if (account == null) console.log("No account selected");
        if (account.transactions.length === 0) {
            notify.set("No transactions to export!");
            setTimeout(() => {
                notify.set("");
            }, 3500);
            return;
        }
        const csv = convertToCSV(account.transactions);
        setClipboard(csv);
        notify.set("Data copied to clipboard!");
        setTimeout(() => {
            notify.set("");
        }, 3500);
    }
    let isAtm: boolean = false;
    atm.subscribe((usingAtm: boolean) => {
        isAtm = usingAtm;
    });
</script>

<section class="transactions-container">
    <div class="feed-header"><div><span class="eyebrow">02 / ACTIVITY MONITOR</span><h3 class="heading">{$translations.transactions}</h3></div><div class="bank-chip"><span class="pulse"></span>{$translations.bank_name}<i class="fa-solid fa-shield-halved"></i></div></div>
    <div class="transactions-search-wrap"><i class="fa-solid fa-filter"></i><input type="text" class="transactions-search" placeholder={$translations.trans_search} bind:value={transSearch}><span>{account?.transactions?.length || 0} RECORDS</span></div>
    <section class="scroller">
        {#if account}
            {#if account.transactions.filter(item => item.message.toLowerCase().includes(transSearch.toLowerCase()) || item.trans_id.toLowerCase().includes(transSearch.toLowerCase()) || item.receiver.toLowerCase().includes(transSearch.toLowerCase())).length > 0}
                {#each account.transactions.filter(item => item.message.toLowerCase().includes(transSearch.toLowerCase()) || item.trans_id.toLowerCase().includes(transSearch.toLowerCase()) || item.receiver.toLowerCase().includes(transSearch.toLowerCase())) as transaction (transaction.trans_id)}
                    <AccountTransactionItem {transaction}/>
                {/each}
            {:else}
                <h3 style="text-align: left; color: #F3F4F5; margin-top: 1rem;">{$translations.trans_not_found}</h3>
            {/if}
        {:else}
            {$translations.select_account}
        {/if}
    </section>
    {#if !isAtm}
        <div class="export-data">
            <button class="btn btn-green" style="display: flex; align-items: center; justify-content: center; gap: 1rem" on:click|preventDefault={handleClickExportData}><i class="fa-solid fa-file-export fa-fw" />
                {$translations.export_data}
            </button>
        </div>
    {/if}
</section>

<style>
    .transactions-container { flex: 1 1 69%; min-width: 0; padding: 0 .4rem; }
    .feed-header { display: flex; align-items: flex-start; justify-content: space-between; }
    .eyebrow { color: var(--clr-cyan); font-size: .67rem; letter-spacing: .16em; }
    .heading { margin: .55rem 0 1.2rem; font: 700 1.65rem "Sora", sans-serif; text-transform: none; letter-spacing: -.03em; }
    .bank-chip { display: flex; align-items: center; gap: .55rem; padding: .65rem .8rem; color: var(--clr-muted); border: 1px solid var(--clr-line); border-radius: .65rem; font-size: .7rem; letter-spacing: .08em; }
    .bank-chip i { color: var(--clr-teal); margin-left: .4rem; }
    .pulse { width: .45rem; height: .45rem; border-radius: 50%; background: var(--clr-teal); box-shadow: 0 0 10px var(--clr-teal); }
    .transactions-search-wrap { display: flex; align-items: center; gap: .7rem; padding: 0 1rem; margin-bottom: 1rem; border: 1px solid rgba(255,255,255,.08); border-radius: .7rem; color: var(--clr-muted); }
    .transactions-search { width: 100%; border: 0; outline: 0; padding: 1rem 0; background: transparent; color: var(--clr-white); }
    .transactions-search-wrap span { white-space: nowrap; color: var(--clr-muted); font-size: .62rem; letter-spacing: .1em; }
    .scroller { height: calc(100% - 10rem); }
    .export-data { display: flex; justify-content: flex-end; margin-top: .8rem; }
</style>
