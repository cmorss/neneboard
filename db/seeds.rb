# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

styles = Style.create([
  { name: 'blueprint' },
  { name: 'napkin' },
  { name: 'whiteboard' },
  { name: 'block' }
])

styles = styles.index_by(&:name).with_indifferent_access

artists = Artist.create([
  { email: 'stewie@neneboard.com'},
  { email: 'brian@neneboard.com' },
  { email: 'glenn@neneboard.com' }
])

time_machine_board = Board.create([
  { name:   'Time Machine Basics',
    artist: artists.first,
    style:  styles[:blueprint]
  },
  { name:   'Physics for 5th Graders',
    artist: artists.first,
    style:  styles[:block]
  }
])

stencils = Stencil.create([
  { name: 'rectangle' },
  { name: 'circle'},
  { name: 'star' }
])

stencils = stencils.index_by(&:name).with_indifferent_access

Renderer.create(stencil: stencils[:rectangle],
                style:   styles[:whiteboard],
                script: %Q{
  ctx.fillStyle   = Whiteboard.fillStyle;
  ctx.strokeStyle = Whiteboard.strokeStyle;
  ctx.lineWidth   = Whiteboard.lineWidth;
  var padding = Math.ceil(Whiteboard.lineWidth / 2.0);
  ctx.strokeRect(padding, padding, attrs.width - padding*2, attrs.height - padding*2);
})

Renderer.create(stencil: stencils[:circle],
                style:   styles[:whiteboard],
                script: %Q{
  ctx.fillStyle   = Whiteboard.fillStyle;
  ctx.strokeStyle = Whiteboard.strokeStyle;
  ctx.lineWidth   = Whiteboard.lineWidth;
  var padding = Math.ceil(Whiteboard.lineWidth / 2.0);
  var radius = attrs.radius || (Math.min(attrs.height-padding, attrs.width-padding) / 2)
  ctx.beginPath();
  ctx.arc(attrs.width/2, attrs.height/2, radius, 0, Math.PI*2, false);
  ctx.closePath();
  ctx.stroke();
})
