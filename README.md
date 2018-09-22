# ui-iconpicker-input
# A Bootstrap 3 - Icon Picker for AngularJS #

This is a twist of the Justin's project: https://github.com/justin-lau/ui-iconpicker

The idea behind this is to use the icon picker only as an attr directive for input elements... Like this: 

```
<div class="form-group">
   <label>MyIcon</label>
   <div class="uib-dropdown">
      <input type="text" ui-iconpicker groups="font-awesome" uib-dropdown-toggle ng-model="iconClass"></input>
   </div>
</div>
```

The original ui-iconpicker can be used in many other ways. 

See it in action: http://justin-lau.github.io/ui-iconpicker/.

### Dependencies ###

[Angular UI Bootstrap](http://angular-ui.github.io/bootstrap/)

[AngularJS](https://angularjs.org/)

[Bootstrap 3](https://getbootstrap.com/docs/3.3/)'s CSS

[Font Awesome v4.7.0](https://fontawesome.com/v4.7.0/) icons.
