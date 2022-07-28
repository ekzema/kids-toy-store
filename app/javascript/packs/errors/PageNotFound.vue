<template>
  <div id="container" >
    <section id="fof">
      <div class="hgroup">
        <h1><span><strong>4</strong></span><span><strong>0</strong></span><span><strong>4</strong></span></h1>
        <h2>Error!<span>page not found</span></h2>
      </div>
    </section>
  </div>
</template>
<script>
export default {
  name: 'page-not-found',
  data: () => ({
  }),
}
</script>

<style scoped>
  #fof{display:block; width:100%; margin:100px 0;  text-align:center;}
  #fof .hgroup{text-transform:uppercase;}
  #fof .hgroup h1{margin-bottom:25px; font-size:80px;}
  #fof .hgroup h1 span{display:inline-block; margin-left:5px; padding:2px; border:1px solid #CCCCCC; overflow:hidden;}
  #fof .hgroup h1 span strong{display:inline-block; padding:0 20px 20px; border:1px solid #CCCCCC; font-weight:normal;}
  #fof .hgroup h2{font-size:60px;}
  #fof .hgroup h2 span{display:block; font-size:30px; font-weight: normal;}
  #fof p{margin:25px 0 0 0; padding:0; font-size:16px;}
  #fof p:first-child{margin-top:0;}
</style>
