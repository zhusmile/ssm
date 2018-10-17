/**
 * Created by Administrator on 2018/9/21.
 * 将所有省份.城市按拼音排序并按首字母归类
 */

function chineseLetter (arr, dataLeven) {
    var letter = 'abcdefghjklmnopqrstwxyz'.split('')
    var zh = "阿八嚓哒妸发旮哈讥咔垃痳拏噢妑七呥扨它穵夕丫帀".split('')
    /* 获取数组元素比较的值 */
    function getValue (option) {
      if (!dataLeven) return option
      var data = option
      dataLeven.split('.').filter(function (item) {
        data = data[item]
      })
      return data + ''
    }
    /* 进行排序 */
    arr.sort(function (item1, item2) {
      return getValue(item1).localeCompare(getValue(item2), 'zh-Hans-CN')
    })
    /* 判断需要排序的字符串是否含有中文字符 */
    if (/[\u4e00-\u9fff]/.test(getValue(arr[0])) && typeof arr[0] === 'object') pySegSort(0, 0)
    /* 给省市区列表中添加首字符 */
    function pySegSort (letterIndex, zhIndex) {
      var first = true // 首次是否加 字母标识
      for (var i = zhIndex; i < arr.length; i++) {
        var item = arr[i]
        //      是否有值 && 当前值大于等于本次字母的最小值 && (最后一位 || 当前值小于下次字母的最小值)
        var state = zh[letterIndex] && getValue(item).localeCompare(zh[letterIndex], 'zh') >= 0 && (letterIndex === letter.length - 1 || getValue(item).localeCompare(zh[letterIndex+1], 'zh') < 0)
        if (state) { // 满足条件，同一个首字母下的：例如 A 下的所有省份
          if (first) { //是否是第一次出现
            item.letter = letter[letterIndex].toUpperCase()
            first = false
          } else {
            item.letter = ''
          }
        } else { // 递归调用 函数，进行下次字母下的排列
          letterIndex++
          if (letterIndex < letter.length) {
            pySegSort(letterIndex, i)
            break
          }
        }
      }
    }
  }
//  chineseLetter(provinceList, 'value')
// console.log(provinceList)