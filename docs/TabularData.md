# Tabular Data

The HTML `<table>` element represents tabular data — that is, information presented in a two-dimensional table comprised of rows and columns of cells containing data.

Willow provides a ready to use component that given a collection can create a table with one row for each object in the collection and one column for each one the user configured.

So for example given the following collection `#(1 2)` you can get this table showing if the number is even or not:

```HTML
<table>
  <tbody>
    <tr>
      <td>false</td>
    </tr>
    <tr>
      <td>true</td>
    </tr>
  </tbody>
</table>
```
by rendering the following `table`

```smalltalk
| table html |

table := self componentSupplier tableBuilder
  addColumn: [ :column | column rendering: [ :number | number even ] ];
  build.

table changeContentsTo: #(1 2).
```
So lets dig a bit on this code. Sending the message `tableBuilder` to the component supplier we get a builder for making tables. Now we can configure the columns we want, in that case we're adding a column and telling it how to render each cell getting each object in the collection as an argument (`number`). The only mandatory configuration we need to provide for a column is the rendering action.

We can send another configuration messages to the column:
- `titled:` allows us to set a title for the column, so now the table will have a header:

```smalltalk
| table html |

table := self componentSupplier tableBuilder
  addColumn: [ :column | column
    rendering: [ :number | number even ];
    titled: 'Is even?' ];
  build.

table changeContentsTo: #(1 2).
```
will produce:
```HTML
<table>
  <thead>
    <th>Is even?</th>
  </thead>
  <tbody>
    <tr>
      <td>false</td>
    </tr>
    <tr>
      <td>true</td>
    </tr>
  </tbody>
</table>
```
- `titled:applying:` works like `titled:` but we can send a command to be applied to the header cell.

```smalltalk
| table html |

table := self componentSupplier tableBuilder
  addColumn: [ :column | column
    rendering: [ :number | number even ];
    titled: 'Is even?' applying: [:cell | cell addClass willow] ];
  build.

table changeContentsTo: #(1 2).
```
will produce:
```HTML
<table>
  <thead>
    <th class="willow">Is even?</th>
  </thead>
  <tbody>
    <tr>
      <td>false</td>
    </tr>
    <tr>
      <td>true</td>
    </tr>
  </tbody>
</table>
```
- `summarizedWith:` and `summarizedWith:applying:` allows us to configure a table footer.

```smalltalk
| table html |

table := self componentSupplier tableBuilder
  addColumn: [ :column | column
    rendering: [ :number | number even ];
    titled: 'Is even?' applying: [:cell | cell addClass willow ];
    summarizedWith: [:numbers | numbers allSatisfy: [ :number | number even ]] ];    
  build.

table changeContentsTo: #(1 2).
```
will produce:
```HTML
<table>
  <thead>
    <th class="willow">Is even?</th>
  </thead>
  <tbody>
    <tr>
      <td>false</td>
    </tr>
    <tr>
      <td>true</td>
    </tr>
  </tbody>
  <tfoot>
    <td>false</td>
  </tfoot>
</table>
```
---
Now we can add another column:
```smalltalk
| table html |

table := self componentSupplier tableBuilder
  addColumn: [ :column | column
				rendering: [ :number | number ];
				summarizedWith: [ [:html | html strong: 'All even?'] ] ];
  addColumn: [ :column | column
    rendering: [ :number | number even ];
    titled: 'Is even?' applying: [:cell | cell addClass willow ];
    summarizedWith: [:numbers | numbers allSatisfy: [ :number | number even ]] ];    
  build.

table changeContentsTo: #(1 2).
```
will produce:
```HTML
<table>
  <thead>
    <th></th>
    <th class="willow">Is even?</th>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>false</td>
    </tr>
    <tr>
      <td>2</td>
      <td>true</td>
    </tr>
  </tbody>
  <tfoot>
    <td><strong>All even?</strong></td>
    <td>false</td>
  </tfoot>
</table>
```
## Container-API
The table component supports the Container API so you can:
- Change it's contents by sending `changeContentsTo:`
- Get the table elements by sending `contents`
- Subscribe to receive notifications when the contents change by sending `notifyChangesTo:`

## Interaction
The table component supports the Willow Interaction API by sending to it the `onTrigger` message, and this will hook in the `click` event of the table.
